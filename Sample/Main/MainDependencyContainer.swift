//
//  MainDependencyContainer.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 25/02/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

class MainDependencyContainer {

  private let userSessionDataStore = FakeUserSessionRepository()
  lazy var launchDependencyContainer = {
    return LaunchDependencyContainer(userSessionStore: userSessionDataStore)
  }()

  func makeLaunchViewController() -> NiblessViewController {
    let signedInViewController = launchDependencyContainer.makeListViewController()
    let navigator = LaunchNavigator(sigendInViewController: signedInViewController)
    let viewModel = LaunchViewModel(userSessionRepository:
      FakeUserSessionRepository())
    let view = LaunchView(frame: .zero)
    return LaunchViewController(
      container: launchDependencyContainer,
      viewModel: viewModel,
      navigator: navigator,
      launchView: view)
  }
}
