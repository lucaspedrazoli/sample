//
//  UserSessionStoreType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 02/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

typealias AuthToken = String

protocol UserSessionStoreType {
  func read() -> UserSessionModel

  @discardableResult
  func save() -> UserSessionModel

  @discardableResult
  func delete() -> UserSessionModel
}
