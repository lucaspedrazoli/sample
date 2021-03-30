//
//  NetworkDataSource.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation
import RxSwift

struct NetworkDataSource<Model: Codable>: NetworkDataSourceType {

  private let session: URLSession
  private let request: Request
  private let logger: LoggerType

  init(endpoint: Request,
       session: URLSession = URLSession.shared,
       logger: LoggerType = Logger()) {
    self.request = endpoint
    self.session = session
    self.logger = logger
  }

  func execute() -> Observable<Model?> {
    let subject = PublishSubject<Model?>()
    let task = session
      .dataTask(with: buildRequest()) { (data, response, error) in
        if let error = error {
          self.logger.log(error, nil)
          subject.onError(error)
          return
        }

        guard let httpResponse = response as? HTTPURLResponse else {
          let info = ["http_response_error": "unexpected_response_error"]
          let error = ErrorInfo(data: info)
          self.logger.log(nil, error)
          subject.onError(error)
          return
        }

        guard 200..<300 ~= httpResponse.statusCode else {
          let info = ["http_unexpected_status_code": httpResponse.statusCode]
          let error = ErrorInfo(data: info)
          self.logger.log(nil, error)
          subject.onError(error)
          return
        }

        if let data = data {
          let model = try? JSONDecoder().decode(Model.self, from: data)
          subject.onNext(model)
          subject.onCompleted()
        }
    }
    task.resume()
    return subject.asObservable()
  }

  private func buildRequest() -> URLRequest {
    var urlComponents = URLComponents(url: request.endpoint.rawValue,
                                      resolvingAgainstBaseURL: false)!
    urlComponents.queryItems = request.params
    var urlRequest = URLRequest(url: urlComponents.url!)
    urlRequest.httpMethod = request.method.rawValue
    return urlRequest
  }
}
