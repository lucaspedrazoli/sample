//
//  UserSessionRepositoryType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 05/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift
import Foundation

protocol UserSessionRepositoryType {
  func readUserSession() -> Observable<UserSessionModel>
  func signUp(newAccount: Any) -> Observable<UserSessionModel>
  func signIn(email: String, password: String) -> Observable<UserSessionModel>
  func signOut(userSession: UserSessionModel) -> Observable<UserSessionModel>
}
