//
//  LaunchAnimatorType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

protocol AnimatorType {
  associatedtype State: Hashable
  var actions: [State: ControllerAction] { get set}

  func animate(for state: State) -> Observable<State>
}
