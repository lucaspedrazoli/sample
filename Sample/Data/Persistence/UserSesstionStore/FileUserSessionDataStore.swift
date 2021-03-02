//
//  FileUserSessionDataStore.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 02/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

let profile = UserProfile(name: "",
                          email: "",
                          mobileNumber: "",
                          avatar: URL(fileURLWithPath: ""))

let remote = RemoteUserSession(token: "")

class FileUserSessionDataStore: UserSessionStoreType {
  func read() -> UserSessionModel {
    return UserSessionModel(profile: profile, remote: remote)
  }

  func save() -> UserSessionModel {
    return UserSessionModel(profile: profile, remote: remote)
  }

  func delete() -> UserSessionModel {
    return UserSessionModel(profile: profile, remote: remote)
  }


}
