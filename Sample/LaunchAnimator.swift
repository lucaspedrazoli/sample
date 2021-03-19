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
      return Observable.just((.loading, loadingAnimation))
    case .signedIn:
      return Observable.just((.signedIn, signedInAnimation))
    case .notSignedIn:
      return Observable.just((.notSignedIn, notSignedInAnimation))
    }
  }

  private func loadingAnimation() {
    print("loading animation")
  }

  private func signedInAnimation() {
    print("signed in animation")
  }

  private func notSignedInAnimation() {
    print("NOT signed in animation")
  }
}

