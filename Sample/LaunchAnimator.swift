//
//  LaunchAnimator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift
import UIKit

class LaunchAnimator: AnimatorType {

  lazy private var subject: BehaviorSubject<LaunchState> = {
    return makeSubject()
  }()

  func animate(for state: LaunchState) -> LaunchState {
    switch state {
    case .loading:
      loadingAnimation()
      subject.onNext(state)
      return state
    default:
      endAnimation()
      subject.onNext(state)
      return state
    }
  }


  private func loadingAnimation() {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
      print("start animation")
    }
  }

  private func endAnimation() {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { [weak self] in
      print("end animation")
      self?.subject.onCompleted()
    }
  }

  private func makeSubject() -> BehaviorSubject<LaunchState> {
    let subject = BehaviorSubject<LaunchState>(value: .loading)
    _ = subject.do(onSubscribe: { [weak self] in
      self?.loadingAnimation()
    })
    return subject
  }
}

