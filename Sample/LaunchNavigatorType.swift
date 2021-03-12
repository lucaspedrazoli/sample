//
//  Navigator.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 11/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

protocol LaunchNavigatorType {
  associatedtype Destination

  func navigate(to destination: Destination)
  func subscribe(to observable: Observable<Destination> )
}
