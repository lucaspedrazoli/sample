//
//  MainDependencyContainer.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 25/02/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

class MainDependencyContainer {
  //let loginContainer = LoginDependencyContainer()
  //let signupContainer = SignupDependencyContainer()
  //let onBoardingContainer = OnboardingDependencyContainer()
  lazy var launchContainer: LaunchDependencyContainer = {
    return makeLaunchContainer()
  }()
  private let userSessionDataStore = UserSessionStore()

  private func makeLaunchContainer() -> LaunchDependencyContainer {
    return LaunchDependencyContainer(userSessionStore: userSessionDataStore)
  }
}
