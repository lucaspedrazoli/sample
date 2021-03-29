//
//  LaunchDependencyContainer.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 02/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class LaunchDependencyContainer {

  let userSessionStore: UserSessionStoreType

  init(userSessionStore: UserSessionStoreType) {
    self.userSessionStore = userSessionStore
  }

  func makeListViewController() -> UIViewController {
    let listViewController = ListViewController()
    return listViewController
  }
}
