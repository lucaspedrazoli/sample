//
//  UserSessionStoreType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 02/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation
import RxSwift

protocol UserSessionStoreType {
  func read() -> Single<UserSessionModel>

  @discardableResult
  func save() -> Single<UserSessionModel>

  @discardableResult
  func delete() -> Single<UserSessionModel>
}
