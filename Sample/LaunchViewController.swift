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
  Navigator: NavigatorType,
  Animator: AnimatorType>: NiblessViewController
  where
  Navigator.Destination == LaunchNavigator.Destination,
  Animator.AnimationType == LaunchAnimator.AnimationType {

  let container: LaunchDependencyContainer
  var viewModel: LaunchViewModel
  let navigator: Navigator
  let animator: Animator
  let bag = DisposeBag()

  public init(
    container: LaunchDependencyContainer,
    viewModel: LaunchViewModel,
    navigator: Navigator,
    animator: Animator) {
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

    navigator
      .navigate(to: .signedIn)
      .subscribe(onNext: { print($0) })
      .disposed(by: bag)
  }
}

