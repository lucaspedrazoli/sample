//
//  LaunchAnimatorType.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 12/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import RxSwift

protocol Animator {
  associatedtype AnimationType

  func animate(_ animation: AnimationType) -> Observable<UIViewPropertyAnimator>
}
