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
    let action = actions[.signedIn]
    return Observable.create { observer in
      action?() {
        observer.onNext(.signedIn)
        observer.onCompleted()
      }
      return Disposables.create()
    }
  }
}
