//
//  Navigator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift
import UIKit

protocol NavigatorType {
  associatedtype State: Hashable
  var actions: [State: StateControllerAction] { get set }

  func navigate(for state: LaunchState) -> Observable<State>
}
