//
//  MarvelListRequest.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

struct MarvelListRequest: RequestType {
  let endpoint: Endpoint
  let method: HTTPVerb
  var params: Array<URLQueryItem> = []
  var body: [String : Any] = [:]
  var header: [String : String] = [:]

  init(endpoint: Endpoint, method: HTTPVerb) {
    self.endpoint = endpoint
    self.method = method
  }
}
