//
//  LaunchAnimator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit
import RxSwift

typealias Closure = ()-> Void

class LaunchAnimator: AnimatorType {

  func animate(for state: LaunchState) -> Observable<(LaunchState, Closure)> {
    switch state {
    case .loading:
      return loadingAnimation()
    case .signedIn:
      return signedInAnimation()
    case .notSignedIn:
      return notSignedInAnimation()
    }
  }

  private func loadingAnimation() -> Observable<(LaunchState, Closure)> {
    let subject = PublishSubject<(LaunchState, Closure)>()
    let action = {
      print("loading animation")
    }
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
      subject.onNext((LaunchState.loading, action))
      subject.onCompleted()
    }
    return subject.asObservable()
  }

  private func signedInAnimation() -> Observable<(LaunchState, Closure)> {
    let subject = PublishSubject<(LaunchState, Closure)>()
    let action = {
      print("signed in animation")
    }
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10) {
      subject.onNext((LaunchState.loading, action))
      subject.onCompleted()
    }
    return subject.asObservable()
  }

  private func notSignedInAnimation() -> Observable<(LaunchState, Closure)> {
    let subject = PublishSubject<(LaunchState, Closure)>()
    let action = {
      print("NOT signed in animation")
    }
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
      subject.onNext((LaunchState.loading, action))
      subject.onCompleted()
    }
    return subject.asObservable()
  }
}

