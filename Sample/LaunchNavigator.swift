//
//  LaunchNavigator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 11/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit
import RxSwift

class LaunchNavigator: NavigatorType {

  let bag = DisposeBag()

  func navigate(to destination: LaunchDestination) -> Observable<UIViewController> {
    let viewController = makeViewController(for: destination)
    return Observable<UIViewController>.just(viewController)
  }

  private func makeViewController(for destination: LaunchDestination) -> UIViewController {
      switch destination {
      case .onboarding:
        return NiblessViewController()
      case .signedIn:
        return NiblessViewController()
      case .signedOut:
        return NiblessViewController()
    }
  }
}
