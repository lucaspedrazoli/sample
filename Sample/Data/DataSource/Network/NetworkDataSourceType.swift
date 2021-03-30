//
//  DataSourceType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

protocol NetworkDataSourceType {
  associatedtype Model

  func execute(_ request: Request) -> Observable<Model?>
}
