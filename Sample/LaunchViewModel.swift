//
//  LaunchViewModel.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 09/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

class LaunchViewModel {

  typealias ObservableType = Observable<LaunchNavigator.Destination>
  
  let userSessionRepository: UserSessionRepositoryType
  let bag = DisposeBag()

  init(userSessionRepository: UserSessionRepositoryType) {
    self.userSessionRepository = userSessionRepository
  }

  func loadUserSession() -> ObservableType {
    return userSessionRepository
      .readUserSession()
      .flatMap(goToNextScreen)
  }

  func goToNextScreen(session: UserSessionModel?) -> ObservableType {
    switch session {
    case .none:
      return ObservableType
        .just(.signedOut)
    case .some:
      return ObservableType
        .just(.signedIn)
    }
  }
}
