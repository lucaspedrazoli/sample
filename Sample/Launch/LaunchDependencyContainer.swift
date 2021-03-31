//
//  LaunchDependencyContainer.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 02/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class LaunchDependencyContainer {

  let userSessionStore: UserSessionRepositoryType

  init(userSessionStore: UserSessionRepositoryType) {
    self.userSessionStore = userSessionStore
  }

  func makeListViewController() -> UIViewController {
    let network = NetworkDataSource()
    let repository = MarvelListRepository(source: network)
    let listView = MarvelListView()
    let listViewController = MarvelListViewController(view: listView)
    return listViewController
  }
}
