//
//  Request.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

struct Request {

  var endpoint: Endpoint
  var params: Array<URLQueryItem>
  var body: [String: Any]?
  var authToken: String?
  let method: HTTPVerb
  private var header: [String: String] = {
    return ["accept_type": "application/json"]
  }()

  mutating func addQueryItem(_ name: String, _ value: String?) {
    params.append(URLQueryItem(name: name, value: value))
  }

  mutating func addHeader(_ name: String, _ value: String) {
    header["name"] = value
  }
}
