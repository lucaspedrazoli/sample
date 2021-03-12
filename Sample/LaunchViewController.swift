//
//  ViewController.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 25/02/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit
import RxSwift

class LaunchViewController<
  N: Navigator,
  A: Animator>: NiblessViewController
  where
  A.AnimationType == LaunchAnimator.AnimationType {

  let container: LaunchDependencyContainer
  var viewModel: LaunchViewModel
  let navigator: N
  let animator: A
  let bag = DisposeBag()

  public init(
    container: LaunchDependencyContainer,
    viewModel: LaunchViewModel,
    navigator: N,
    animator: A) {
    self.viewModel = viewModel
    self.container = container
    self.navigator = navigator
    self.animator = animator
    super.init()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    let startAnimation = animator.animate(.start)
    let loadUserSession = viewModel.loadUserSession()
    Observable
      .combineLatest(startAnimation, loadUserSession)
      .subscribe(onNext: { value in
        print(value)
      })
      .disposed(by: bag)


    animator
      .animate(.start)
      .subscribe(onCompleted: { print("completed") })
      .disposed(by: bag)
  }
}

