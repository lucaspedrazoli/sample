//
//  DataSourceType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 04/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

protocol NetworkDataSourceType {

  func execute<
    Model: Codable,
    ErrorType: Codable>(_ request: RequestType,
                        modelType: Model.Type,
                        errorType: ErrorType.Type) -> Observable<Model?>
}
