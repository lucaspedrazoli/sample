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

}

extension UserSessionModel: Equatable {

  static func == (lhs: Self, rhs: Self) -> Bool {
    return lhs.profile == rhs.profile &&
      lhs.remote == rhs.remote
  }

}
