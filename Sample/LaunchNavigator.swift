//
//  LaunchNavigator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 11/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit
import RxSwift

struct LaunchNavigator: NavigatorType {
  let navigationController: NiblessNavigationController

  func navigate(for state: LaunchState) -> Observable<(LaunchState, Closure)> {
    switch state {
      default:
        return teste()
      }
  }

  private func teste() -> Observable<(LaunchState, Closure)> {
    let subject = PublishSubject<(LaunchState, Closure)>()
    let action = {
      print("teste navigation")
    }
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
      subject.onNext((LaunchState.signedIn, action))
      subject.onCompleted()
    }
    return subject.asObservable()
  }
}
