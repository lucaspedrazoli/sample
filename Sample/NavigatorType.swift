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

  associatedtype State

  func nextScreen(for state: State) -> Observable<LaunchState>
}
