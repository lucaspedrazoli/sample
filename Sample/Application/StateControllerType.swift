//
//  StateControllerType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

protocol StateControllerType {
  associatedtype State: Hashable
  var actions: [State: StateControllerAction] { get set}

  func perform(for state: State) -> Observable<State>
}
