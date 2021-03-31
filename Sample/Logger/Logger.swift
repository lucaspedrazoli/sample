//
//  Logger.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

struct Logger: LoggerType {
  func log(_ error: Error?, _ info: ErrorInfo?) {
    print("\n\n")
    print("===================================")
    print("ERROR TYPE ------------>")
    dump(error)
    print("ERROR INFO ------------>")
    dump(info)
    print("===================================")
    print("\n\n")
  }
}
