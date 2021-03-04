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
}

extension Endpoint {
  var rawValue: URL {
      switch self {
      case .fake:
        return URL(string: "www.google.com")!
      }
  }
}
