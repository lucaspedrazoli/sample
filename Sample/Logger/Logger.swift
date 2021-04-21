//
//  Logger.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

struct Logger: LoggerType {

  private var shouldPrint = false

  func log(_ error: Error?, _ info: ErrorInfo?, context: LogContext) {
    print("\n\n")
    print(context.rawValue.uppercased())
    print("===================================")
    if let error = error {
      print("ERROR TYPE ------------>")
      dump(error)
    }
    if let info = info {
      print("ERROR INFO ------------>")
      dump(info)
    } else {
      print("NO DATA TO PRINT")
    }
    print("===================================")
    print("\n\n")
  }

  func printData(_ info: [String: Any], object: Any, context: LogContext) {
    guard shouldPrint else { return }
    print("\n\n")
    print(context.rawValue.uppercased())
    print("===================================")
    print("INFO ------------>")
    if !info.isEmpty {
      print(info)
    }
    dump(object)
  }
}
