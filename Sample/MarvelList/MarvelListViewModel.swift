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
  private let orderBy = "-modified"
  private let marvelListRepository: MarvelListRepositoryType
  private let userSessionRepository: UserSessionRepositoryType
  private(set) var request: RequestType
  private var loadedItems = 0

  init(marvelListRepository: MarvelListRepositoryType,
       userSessionRepository: UserSessionRepositoryType,
       request: RequestType) {
    self.marvelListRepository = marvelListRepository
    self.userSessionRepository = userSessionRepository
    self.request = request
  }

  func load(for: MarvelListState) -> Observable<MarvelList> {
    return userSessionRepository
      .readUserSession()
      .compactMap { $0 }
      .flatMap(list)
  }

  private func list(_ session: UserSessionModel) -> Observable<MarvelList> {
    let timestamp = Date.roundedTimestamp()
    let hash = session.hash(timestamp)
    request.addQueryItem(.timeStamp, timestamp)
    request.addQueryItem(.token, session.remote.token)
    request.addQueryItem(.tokenHash, hash)
    request.addQueryItem(.limit, listLimit)
    request.addQueryItem(.orderBy, orderBy)
    return marvelListRepository
      .get(request)
      .compactMap { $0 }
  }
}
