//
//  LaunchAnimator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit
import RxSwift

class LaunchAnimator: AnimatorType {

  let subject = PublishSubject<LaunchState>()

  func animate(for state: LaunchState) -> Observable<LaunchState> {
    switch state {
    case .loading:
      loadingAnimation()
    case .signedIn, .ending, .notSignedIn, .onboard:
      endAnimation()
    default:
      print("animate? \(state)")
    }
    return subject.share()
  }

  private func loadingAnimation() {
    print("start animation")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
      self.subject.onNext(.loading)
    }
  }

  private func endAnimation() {
    print("end animation")
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
      self.subject.onNext(.ending)
      self.subject.onCompleted()
    }
  }
}

