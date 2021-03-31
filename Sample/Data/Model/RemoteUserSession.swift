//
//  RemoteUserSession.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 02/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

struct RemoteUserSession: Codable, Equatable {

  let token: AuthToken
  let privateToken: AuthToken
}


