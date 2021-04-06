//
//  MarvelListAnimator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 06/04/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

struct MarvelListAnimator: AnimatorType {
  var actions: [MarvelListState: StateControllerAction] = [:]

  func animate(for state: MarvelListState) -> Observable<MarvelListState> {
    return .empty()
  }
}
