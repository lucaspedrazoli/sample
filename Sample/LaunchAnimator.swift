//
//  LaunchAnimator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit
import RxSwift

struct LaunchAnimator: AnimatorType {
  var actions: [LaunchState : ControllerAction] = [:]

  func animate(for state: LaunchState) -> Observable<LaunchState> {
    switch state {
    case .loading:
      return loadingAnimation()
    case .signedIn:
      return signedInAnimation()
    case .notSignedIn:
      return notSignedInAnimation()
    }
  }

  private func loadingAnimation() -> Observable<LaunchState> {
    return Observable.create { observer in
      let action = self.actions[.loading]
      action?() {
        observer.onNext(.loading)
        observer.onCompleted()
      }
      return Disposables.create()
    }
  }

  private func signedInAnimation() -> Observable<LaunchState> {
    return Observable.create { observer in
      let action = self.actions[.signedIn]
      action?() {
        observer.onNext(.signedIn)
        observer.onCompleted()
      }
      return Disposables.create()
    }
  }

  private func notSignedInAnimation() -> Observable<LaunchState> {
    return Observable.create { observer in
      let action = self.actions[.notSignedIn]
      action?() {
        observer.onNext(.notSignedIn)
        observer.onCompleted()
      }
      return Disposables.create()
    }
  }
}

