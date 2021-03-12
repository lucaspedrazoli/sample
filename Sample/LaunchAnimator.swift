//
//  LaunchAnimator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift
import UIKit

struct LaunchAnimator: LaunchAnimatorType {

  typealias ObservableType = Observable<UIViewPropertyAnimator>

  enum AnimationType {
    case start
  }

  func animate(_ animation: AnimationType) -> ObservableType {
    switch animation {
    case .start:
      let animation = createStartAnimation()
      return ObservableType.just(animation)
    }
  }

  private func createStartAnimation() -> UIViewPropertyAnimator {
    return UIViewPropertyAnimator()
  }
}
