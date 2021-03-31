//
//  MarvelListRepository.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

struct MarvelListRepository: MarvelListRepositoryType {

  let source: NetworkDataSourceType

  init(source: NetworkDataSourceType) {
    self.source = source
  }

  func get(_ request: Request) -> Observable<[MarvelListItem]?> {
    return source
      .execute(request, type: [MarvelListItem].self)
  }
}
