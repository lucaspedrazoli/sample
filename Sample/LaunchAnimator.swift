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
  typealias Subject = PublishSubject<Closure>

  lazy var subject = {
    return makeSubject()
  }()

  func animate(_ animation: LaunchAnimationType) -> ObservableType {
    switch animation {
    case .start:
      let animation = makeStartAnimation()
      return ObservableType.just(animation)
    case .end:
      let animation = makeEndAnimation()
      return ObservableType.just(animation)
    }
  }


  private func makeStartAnimation() -> Closure {
    return { }
  }

  private func makeEndAnimation() -> Closure {
    return {  }
  }

  private func makeSubject() -> ObservableType {
    let subject = Subject()
    return subject.do(onCompleted: {
      let animation = self.makeEndAnimation()
      animation()
    }, onSubscribe: {
      let animation = self.makeStartAnimation()
      animation()
    })
  }
}

