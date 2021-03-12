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

  enum Destination {
    case onboarding, signedIn, signedOut
  }

  let navigationController: UINavigationController
  let bag = DisposeBag()

  init(navigationController: UINavigationController) {
      self.navigationController = navigationController
  }

  func navigate(to destination: Destination) {
    let viewController = makeViewController(for: destination)
    navigationController.pushViewController(viewController, animated: true)
  }

  func subscribe(to observable: Observable<Destination>) {
    observable
      .subscribe(onNext: navigate)
      .disposed(by: bag)
  }

  private func makeViewController(for destination: Destination) -> UIViewController {
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
