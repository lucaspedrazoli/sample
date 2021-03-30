//
//  MarvelListRepository.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

struct MarvelListRepository: MarvelListRepositoryType {
  func get() -> Observable<[MarvelListItem]> {
    return .empty()
  }
}
