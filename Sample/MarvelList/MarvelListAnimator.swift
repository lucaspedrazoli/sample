//
//  MarvelListAnimator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 06/04/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

struct MarvelListAnimator: StateControllerType {
  var actions: [MarvelListState: StateControllerAction] = [:]

  func perform(for state: MarvelListState) -> Observable<MarvelListState> {
    return .empty()
  }
}
