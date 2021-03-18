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
  let subject = PublishSubject<LaunchState>()

  func nextScreen(for state: LaunchState) -> Observable<LaunchState> {
    navigate(for: state)
    return subject.asObserver()
  }

  private func navigate(for state: LaunchState) {
      switch state {
      default:
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
          print("default navigation")
          self.subject.onNext(state)
          self.subject.onCompleted()
        }
    }
  }
}
