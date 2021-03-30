//
//  Request.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

protocol Request {

  var endpoint: Endpoint { get }
  var method: HTTPVerb { get }
  var params: Array<URLQueryItem> { get set }
  var body: [String: Any] { get set }
  var header: [String: String] { get set }
}

extension Request {
  mutating func addQueryItem(_ name: String, _ value: String?) {
    params.append(URLQueryItem(name: name, value: value))
  }

  mutating func addHeader(_ name: String, _ value: String) {
    header[name] = value
  }
}
