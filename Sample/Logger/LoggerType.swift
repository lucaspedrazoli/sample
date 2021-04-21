//
//  LoggerType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

protocol LoggerType {
  func log(_ error: Error?, _ info: ErrorInfo?, context: LogContext)
  func printData(_ info: [String: Any], object: Any, context: LogContext)
}
