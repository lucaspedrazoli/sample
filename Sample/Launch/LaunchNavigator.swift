//
//  LaunchNavigator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 11/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

struct LaunchNavigator: StateControllerType {

  var sigendInViewController: NiblessViewController

  func perform(for state: LaunchState) {
    switch state {
       default:
         signedInnavigation()
    }
  }

  private func signedInnavigation() {
    
  }
}
