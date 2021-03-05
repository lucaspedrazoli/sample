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

  let profile = UserProfile(name: "",
                            email: "",
                            mobileNumber: "",
                            avatar: URL(fileURLWithPath: ""))

  let remote = RemoteUserSession(token: "")

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
