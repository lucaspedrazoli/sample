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

  func nextScreen(for state: LaunchState) -> Observable<(LaunchState, Closure)> {
    return navigate(for: state)
  }

  private func navigate(for state: LaunchState) -> Observable<(LaunchState, Closure)> {
    switch state {
      default:
        return Observable.just((state, teste))
      }
  }

  private func teste() {
    print("teste navigation")
  }
}
