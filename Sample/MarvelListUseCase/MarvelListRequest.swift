//
//  MarvelListRequest.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

struct MarvelListRequest: Request {
  let endpoint: Endpoint
  let method: HTTPVerb
  var params: Array<URLQueryItem>
  var body: [String : Any] = [:]
  var header: [String : String] = [:]

  init(token: AuthToken, tokenHash: TokenHash) {
    endpoint = .marvelList
    method = .GET
    params = [
      URLQueryItem(name: "apikey", value: token),
      URLQueryItem(name: "hash", value: tokenHash),
      URLQueryItem(name: "limit", value: "20")
    ]
  }
}
