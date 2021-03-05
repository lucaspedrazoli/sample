//
//  UserSessionStore.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 02/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation
import RxSwift

class UserSessionStore: UserSessionStoreType {

  let profile = UserProfile(name: "User",
                            email: "user@user.com",
                            mobileNumber: "11898755890")

  let remote = RemoteUserSession(token: "123abc")

  func read() -> Single<UserSessionModel> {
    return Single
      .just(UserSessionModel(profile: profile,
                             remote: remote))
  }

  func save() -> Single<UserSessionModel> {
    return Single
      .just(UserSessionModel(profile: profile,
                             remote: remote))
  }

  func delete() -> Single<UserSessionModel> {
    return Single
      .just(UserSessionModel(profile: profile,
                             remote: remote))
  }
}
