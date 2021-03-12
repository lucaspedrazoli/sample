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

  associatedtype Destination

  func navigate(to destination: Destination) -> Observable<UIViewController>
}
