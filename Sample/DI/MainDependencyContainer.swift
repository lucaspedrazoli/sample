//
//  MainDependencyContainer.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 25/02/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

class MainDependencyContainer {

  private let userSessionDataStore = UserSessionStore()

  func makeLaunchViewController() -> NiblessViewController {
    let navigator = LaunchNavigator()
    let viewModel = LaunchViewModel(userSessionRepository:
      FakeUserSessionRepository())
    let animator = LaunchAnimator()
    let container = LaunchDependencyContainer(userSessionStore:
      userSessionDataStore)
    return LaunchViewController(
      container: container,
      viewModel: viewModel,
      navigator: navigator,
      animator: animator)
  }
}
