//
//  NetworkDataSource.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation
import RxSwift

struct NetworkDataSource: NetworkDataSourceType {

  private let session: URLSession
  private let logger: LoggerType

  init(session: URLSession = URLSession.shared,
       logger: LoggerType = Logger()) {
    self.session = session
    self.logger = logger
  }

  func execute<
    Model: Codable,
    ErrorType: Codable>(_ request: RequestType,
                        modelType: Model.Type,
                        errorType: ErrorType.Type) -> Observable<Model?> {
    let subject = PublishSubject<Model?>()
    let _request = request.buildRequest()
    let task = session
      .dataTask(with: _request) { (data, response, error) in
        if let error = error {
          self.logger.log(error, nil)
          subject.onError(error)
          return
        }

        guard let httpResponse = response as? HTTPURLResponse else {
          let info = [
            "http_response_error": "unexpected_response_error",
            "url": "\(String(describing: _request.url))"
          ]
          let error = ErrorInfo(data: info)
          self.logger.log(nil, error)
          subject.onError(error)
          return
        }

        guard 200..<300 ~= httpResponse.statusCode else {
          var errorModel: ErrorType?
          if let data = data {
            errorModel = try? JSONDecoder().decode(ErrorType.self, from: data)
          }
          let info = [
            "http_unexpected_status_code": "\(httpResponse.statusCode)",
            "url": "\(String(describing: _request.url))",
            "error": "\(errorModel.debugDescription)"
            ]
          let error = ErrorInfo(data: info)
          self.logger.log(nil, error)
          subject.onError(error)
          return
        }

        if let data = data {
          let model = try? JSONDecoder().decode(Model.self, from: data)
          print("Network response ------>")
          dump(model)
          subject.onNext(model)
          subject.onCompleted()
        }
    }
    task.resume()
    return subject.asObservable()
  }
}
