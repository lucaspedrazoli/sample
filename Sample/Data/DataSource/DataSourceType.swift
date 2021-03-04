//
//  DataSourceType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

protocol DataSourceType {
  associatedtype Element

  @discardableResult
  func create(element: Element) -> Single<Element?>

  func read() -> Single<Element>

  @discardableResult
  func update(_ element: Element) -> Single<Element?>

  @discardableResult
  func delete(element: Element) -> Single<Element?>
}

extension DataSourceType {

  @discardableResult
  func create(element: Element) -> Single<Element?> {
    return Single.just(nil)
  }

  @discardableResult
  func update(element: Element) -> Single<Element?> {
    return Single.just(nil)
  }

  @discardableResult
  func delete(element: Element) -> Single<Element?> {
    return Single.just(nil)
  }
}
