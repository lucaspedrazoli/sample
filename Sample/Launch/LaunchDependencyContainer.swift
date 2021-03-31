//
//  LaunchDependencyContainer.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 02/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class LaunchDependencyContainer {

  let userSessionRepository: UserSessionRepositoryType

  init(userSessionStore: UserSessionRepositoryType) {
    self.userSessionRepository = userSessionStore
  }

  func makeListViewController() -> UIViewController {
    let network = NetworkDataSource()
    let repository = MarvelListRepository(source: network)
    let request = MarvelListRequest(endpoint: .marvelList, method: .GET)
    let viewModel = MarvelListViewModel(marvelListRepository: repository,
                                        userSessionRepository: userSessionRepository,
                                        request: request)
    let listView = MarvelListView()
    let listViewController = MarvelListViewController(view: listView)
    return listViewController
  }
}
