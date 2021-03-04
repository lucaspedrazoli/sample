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

  private let session = URLSession(configuration: .default)
  private let endpoint: Endpoint
  private let subject: Subject
  lazy private(set) var observable = {
    return subject.asSingle()
  }()

  init(endpoint: Endpoint, subject: Subject) {
    self.endpoint = endpoint
    self.subject = subject
  }

  func execute() {
    let task = session
      .dataTask(with: endpoint.rawValue)
      {(data, response, error) in
        if let error = error {
          self.subject.onError(error)
          return
        }
        let model = try? JSONDecoder().decode(Model.self, from: data!)
        self.subject.onNext(model)
    }
    task.resume()
  }
}
