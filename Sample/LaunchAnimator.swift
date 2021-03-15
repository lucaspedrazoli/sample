//
//  LaunchAnimator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift
import UIKit

struct LaunchAnimator: AnimatorType {

  typealias Closure = () -> Void
  typealias ObservableType = Observable<Closure>

  func animate(_ animation: LaunchAnimationType) -> ObservableType {
    switch animation {
    case .start:
      let animation = stubAnimation()
      return ObservableType.just(animation)
    case .end:
      let animation = stubAnimation()
      return ObservableType.just(animation)
    }
  }

  private func stubAnimation() -> Closure {
    return { }
  }
}

