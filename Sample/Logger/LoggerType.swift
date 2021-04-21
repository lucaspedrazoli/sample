//
//  LoggerType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

protocol LoggerType {
  func log(_ error: Error?, _ info: ErrorInfo?, context: LogContext)
  func printData(_ info: [String: String?], object: Mirror, context: LogContext)
}
