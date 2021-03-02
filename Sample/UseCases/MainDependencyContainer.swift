//
//  MainDependencyContainer.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 25/02/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import Foundation

class MainDependencyContainer {

  let onBoardingContainer = OnboardingDependencyContainer()
  let launchContainer = LaunchDependencyContainer()
  let loginContainer = LoginDependencyContainer()
  let signupContainer = SignupDependencyContainer()

  init() {
    
  }
}
