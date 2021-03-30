//
//  Endpoint.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

enum Endpoint {
  case fake
  case marvelList
}

extension Endpoint {
  var rawValue: URL {
      switch self {
      case .fake:
        return URL(string: "www.google.com")!
      case .marvelList:
        return URL(string: "https://gateway.marvel.com/v1/public/characters")!
      }
  }
}
