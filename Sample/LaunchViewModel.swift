//
//  LaunchViewModel.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 09/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation
import RxSwift

class LaunchViewModel {

  let userSessionRepository: UserSessionRepositoryType

  init(userSessionRepository: UserSessionRepositoryType) {
    self.userSessionRepository = userSessionRepository
  }

  func loadSession() -> Observable<(LaunchState, Closure)> {
    return userSessionRepository
            .readUserSession()
            .flatMap(stateForSession)
  }

  private func stateForSession(_ session: UserSessionModel?) -> Observable<(LaunchState, Closure)> {
    switch session {
    case .none:
      let action = {
        print("session NOT signed in")
      }
      return Observable.just((LaunchState.notSignedIn, action))

    case .some:
      let action = {
          print("session signed in")
      }
      return Observable.just((LaunchState.signedIn, action))
    }
  }
}
