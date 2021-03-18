//
//  LaunchViewModel.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 09/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

class LaunchViewModel {

  let subject = PublishSubject<LaunchState>()
  let userSessionRepository: UserSessionRepositoryType
  let bag = DisposeBag()

  init(userSessionRepository: UserSessionRepositoryType) {
    self.userSessionRepository = userSessionRepository
  }

  func loadSession(for state: LaunchState) -> Observable<LaunchState> {
    guard state == .loading else { return Observable.just(.error) }
    return userSessionRepository
            .readUserSession()
            .flatMap(stateForSession)
  }

  private func stateForSession(_ session: UserSessionModel?) -> Observable<LaunchState> {
    switch session {
    case .none:
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("load session NOT signed in")
        self.subject.onNext(.notSignedIn)
      }

    case .some:
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("load session signed in")
        self.subject.onNext(.signedIn)
        self.subject.onCompleted()
      }
    }
    return subject.asObserver()
  }
}
