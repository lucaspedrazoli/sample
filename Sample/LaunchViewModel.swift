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

  func loadSession() -> Observable<LaunchState> {
    return userSessionRepository
            .readUserSession()
            .flatMap(stateForSession)
  }

  private func stateForSession(_ session: UserSessionModel?) -> Observable<LaunchState> {
    switch session {
    case .none:
      return Observable.just(.notSignedIn)

    case .some:
      return Observable.just(.signedIn)
    }
  }
}
