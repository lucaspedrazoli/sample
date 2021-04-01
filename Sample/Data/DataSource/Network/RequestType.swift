//
//  Request.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

protocol RequestType {

  var endpoint: Endpoint { get }
  var method: HTTPVerb { get }
  var params: Array<URLQueryItem> { get set }
  var body: [String: Any] { get set }
  var header: [String: String] { get set }
}

extension RequestType {
  mutating func addQueryItem(_ key: MarvelQueryKey, _ value: String?) {
    params.append(URLQueryItem(name: key.rawValue, value: value))
  }

  mutating func addHeader(_ name: String, _ value: String) {
    header[name] = value
  }

  func buildRequest() -> URLRequest {
    var urlComponents = URLComponents(url: endpoint.rawValue,
                                            resolvingAgainstBaseURL: false)!
    urlComponents.queryItems = params
    var urlRequest = URLRequest(url: urlComponents.url!)
    urlRequest.httpMethod = method.rawValue
    return urlRequest
  }
}
