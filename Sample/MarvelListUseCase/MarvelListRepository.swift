//
//  MarvelListRepository.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

struct MarvelListRepository<Source: NetworkDataSourceType>: MarvelListRepositoryType {

  init(source: Source) {
    
  }

  func get() -> Observable<[MarvelListItem]> {
    return .empty()
  }
}
