//
//  LaunchAnimator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit
import RxSwift

struct LaunchAnimator: StateControllerType {
  var actions: [LaunchState : StateControllerAction] = [:]

  func perform(for state: LaunchState) -> Observable<LaunchState> {
    switch state {
    case .error:
      return error()
    default:
      return animate(for: state)
    }
  }

  private func animate(for state: LaunchState) -> Observable<LaunchState> {
    return Observable.create { observer in
      let action = self.actions[state]
      action?() {
        observer.onNext(.loading)
        observer.onCompleted()
      }
      return Disposables.create()
    }
  }

  func error() -> Observable<LaunchState> {
    return Observable.create { observer in
      let action = self.actions[.error]
      action?() {
        let error = NSError(domain: "", code: 0, userInfo: nil)
        observer.onError(error)
      }
      return Disposables.create()
    }
  }
}

