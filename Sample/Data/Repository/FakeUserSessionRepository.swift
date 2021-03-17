//
//  FakeUserSessionRepository.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 17/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

struct FakeUserSessionRepository: UserSessionRepositoryType {

  func readUserSession() -> Observable<UserSessionModel> {
    return Observable.just(UserSessionModel.empty())
  }

  func signUp(newAccount: Any) -> Observable<UserSessionModel> {
    return Observable.just(UserSessionModel.empty())
  }

  func signIn(email: String, password: String) -> Observable<UserSessionModel> {
    return Observable.just(UserSessionModel.empty())
  }

  func signOut(userSession: UserSessionModel) -> Observable<UserSessionModel> {
    return Observable.just(UserSessionModel.empty())
  }


}
