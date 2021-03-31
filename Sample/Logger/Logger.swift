//
//  Logger.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

struct Logger: LoggerType {
  func log(_ error: Error?, _ info: ErrorInfo?) {
    print("ERROR TYPE: \(String(describing: error))")
    print("ERROR INFO: \(String(describing: info))")
  }
}
