//
//  MarvelListRepository.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

struct MarvelListRepository<Source: NetworkDataSourceType>: MarvelListRepositoryType {

  let source: Source

  init(source: Source) {
    self.source = source
  }

  func get(_ request: Request) -> Observable<[MarvelListItem]?> {
    //source.execute(request)
    return .empty()
  }
}
