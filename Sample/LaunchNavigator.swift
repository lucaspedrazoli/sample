//
//  LaunchNavigator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 11/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

struct LaunchNavigator: NavigatorType {
  var actions: [LaunchState : ControllerAction] = [:]

  func navigate(for state: LaunchState) -> Observable<LaunchState> {
    switch state {
      default:
        return teste()
      }
  }

  private func teste() -> Observable<LaunchState> {
    let subject = PublishSubject<LaunchState>()
    let action = actions[.signedIn]
    action?() {
      subject.onNext(.signedIn)
      subject.onCompleted()
    }
    return subject.asObservable()
  }
}
