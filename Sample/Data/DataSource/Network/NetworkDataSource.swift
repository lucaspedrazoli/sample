//
//  NetworkDataSource.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation
import RxSwift

struct NetworkDataSource <M: Decodable>: DataSourceType {

  typealias Model = M
  typealias Subject = PublishSubject<Model?>

  private let session: URLSession
  private let endpoint: Endpoint
  private let subject: Subject
  private let logger: LoggerType
  lazy private(set) var observable = {
    return subject.asSingle()
  }()

  init(endpoint: Endpoint,
       subject: Subject,
       session: URLSession = URLSession.shared,
       logger: LoggerType) {
    self.endpoint = endpoint
    self.subject = subject
    self.session = session
    self.logger = logger
  }

  func execute() {
    let task = session
      .dataTask(with: endpoint.rawValue) { (data, response, error) in
        if let error = error {
          self.subject.onError(error)
          self.logger.log(error, [:])
          return
        }

        guard let httpResponse = response as? HTTPURLResponse else {
          let info = ["http_response_error": "unexpected_response_error"]
          self.logger.log(nil, info)
          return
        }

        guard 200...299 ~= httpResponse.statusCode else {
          let info = ["http_unexpected_status_code": httpResponse.statusCode]
          self.logger.log(nil, info)
          return
        }

        if let data = data {
          let model = try? JSONDecoder().decode(Model.self, from: data)
          self.subject.onNext(model)
        }
    }
    task.resume()
  }
}
