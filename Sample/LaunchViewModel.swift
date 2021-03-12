//
//  LaunchViewModel.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 09/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

class LaunchViewModel {

  typealias NavigationObservable = Observable<LaunchNavigator.Destination>
  
  let userSessionRepository: UserSessionRepositoryType
  let bag = DisposeBag()

  init(userSessionRepository: UserSessionRepositoryType) {
    self.userSessionRepository = userSessionRepository
  }

  func loadUserSession() -> NavigationObservable {
    return userSessionRepository
      .readUserSession()
      .flatMap(goToNextScreen)
  }

  func goToNextScreen(session: UserSessionModel?) -> NavigationObservable {
    switch session {
    case .none:
      return NavigationObservable
        .just(.signedOut)
    case .some:
      return NavigationObservable
        .just(.signedIn)
    }
  }
}
