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
    default:
      endAnimation()
    }
    return subject.share()
  }

  private func loadingAnimation() {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
      print("start animation")
      self.subject.onNext(.loading)
    }
  }

  private func endAnimation() {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
      print("end animation")
      self.subject.onNext(.ending)
      self.subject.onCompleted()
    }
  }
}

