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
  let bag = DisposeBag()
  let navigationController: NiblessNavigationController

  func nextScreen(for state: LaunchState) -> Observable<LaunchState> {
    let viewController = makeViewController(for: state)
    navigationController.pushViewController(viewController, animated: true)
    return Observable<LaunchState>.just(.ending)
  }

  private func makeViewController(for state: LaunchState) -> UIViewController {
      switch state {
      default:
        return NiblessViewController()
    }
  }
}
