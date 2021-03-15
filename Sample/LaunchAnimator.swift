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

  typealias Closure = () -> Void
  typealias Subject = PublishSubject<Closure>

  lazy private var subject: Subject = {
    return makeSubject()
  }()

  lazy var observable: Observable<Closure> = {
    return subject.asObservable()
  }()

  func animate(_ animation: LaunchAnimationType) -> Observable<Closure> {
    switch animation {
    case .start:
      subject.onNext(makeStartAnimation())
      return observable
    case .end:
      subject.onNext(makeEndAnimation())
      return observable
    }
  }


  private func makeStartAnimation() -> Closure {
    return {
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
        print("start animation")
      }
    }
  }

  private func makeEndAnimation() -> Closure {
    return {
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { [weak self] in
        self?.subject.onCompleted()
        print("end animation")
      }
    }
  }

  private func makeSubject() -> Subject {
    let subject = Subject()
    _ = subject.do(onCompleted: { [weak self] in
      let animation = self?.makeEndAnimation()
      animation?()
    }, onSubscribe: { [weak self] in
      let animation = self?.makeStartAnimation()
      animation?()
    })
    return subject
  }
}

