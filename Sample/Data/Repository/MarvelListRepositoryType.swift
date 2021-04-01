//
//  MarvelListRepositoryType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

protocol MarvelListRepositoryType {
  func get(_ request: RequestType) -> Observable<MarvelList>
}
