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
    let subject = PublishSubject<LaunchState>()
    let action = actions[.loading]
    action?() {
      subject.onNext(.loading)
      subject.onCompleted()
    }
    return subject.asObservable()
  }

  private func signedInAnimation() -> Observable<LaunchState> {
    let subject = PublishSubject<LaunchState>()
    let action = actions[.signedIn]
    action?() {
      subject.onNext(.signedIn)
    }
    return subject.asObservable()
  }

  private func notSignedInAnimation() -> Observable<LaunchState> {
    let subject = PublishSubject<LaunchState>()
    let action = actions[.notSignedIn]
    action?() {
      subject.onNext(.notSignedIn)
    }
    return subject.asObservable()
  }
}

