//
//  DataSourceType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

protocol DataSourceType {
  associatedtype Model

  func execute() -> Observable<Model?>
}
