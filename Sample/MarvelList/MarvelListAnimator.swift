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
    return animate(for: state)
  }

  private func animate(for state: MarvelListState) -> Observable<MarvelListState> {
    return Observable.create { observer in
      let action = self.actions[state]
      action?() {
        observer.onNext(.loading)
        observer.onCompleted()
      }
      return Disposables.create()
    }
  }

  private func showError() -> Observable<MarvelListState> {
    return Observable.create { observer in
      let action = self.actions[.error]
      action?() {
        let error = NSError(domain: "", code: 0, userInfo: nil)
        observer.onError(error)
      }
      return Disposables.create()
    }
  }
}
