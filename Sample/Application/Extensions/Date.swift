//
//  Date.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 31/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

extension Date {
  static func roundedTimestamp() -> String {
    let date = Date()
    let timestamp = Int64(date.timeIntervalSince1970.rounded())
    return String(timestamp)
  }
}
