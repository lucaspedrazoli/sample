//
//  UserSessionModel.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 02/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

struct UserSessionModel: Codable {

  let profile: UserProfile
  let remote: RemoteUserSession

  static func fakeData() -> UserSessionModel {
    let profile = UserProfile(name: "Foo",
                              email: "foo@bar.com",
                              mobileNumber: "11978767898")
    let remote = RemoteUserSession(token: ApiKeys.marvelToken,
                                   privateToken: ApiKeys.marvelPrivateToken)
    return UserSessionModel(profile: profile,
                            remote: remote)
  }

  func hash(_ timeStamp: String) -> String {
    return (timeStamp + remote.privateToken +  remote.token).toMD5()
  }

}

extension UserSessionModel: Equatable {

  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.profile == rhs.profile &&
      lhs.remote == rhs.remote
  }

}
