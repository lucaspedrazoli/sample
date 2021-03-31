//
//  MarvelListViewModel.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 31/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

class MarvelListViewModel {
  private let listLimit = "20"
  private let marvelListRepository: MarvelListRepositoryType
  private let userSessionRepository: UserSessionRepositoryType
  private(set) var request: RequestType

  init(marvelListRepository: MarvelListRepositoryType,
       userSessionRepository: UserSessionRepositoryType,
       request: RequestType) {
    self.marvelListRepository = marvelListRepository
    self.userSessionRepository = userSessionRepository
    self.request = request
  }

  func load(for: MarvelListState) -> Observable<[MarvelListItem]> {
    return userSessionRepository
      .readUserSession()
      .compactMap { $0 }
      .flatMap(list)
  }

  private func list(_ session: UserSessionModel) -> Observable<[MarvelListItem]> {
    request.addQueryItem(.token, session.remote.token)
    request.addQueryItem(.tokenHash, session.remote.hash)
    request.addQueryItem(.limit, listLimit)
    return marvelListRepository
      .get(request)
      .compactMap { $0 }
  }
}
