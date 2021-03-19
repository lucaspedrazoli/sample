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
  Navigator.State == LaunchState,
  Animator.State == LaunchState {

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
    print("didload")
    animator
      .animate(for: .loading)
      .flatMap { element -> Observable<(LaunchState, Closure)> in
        element.1()
        return self.viewModel.loadSession()
      }
      .flatMap { element -> Observable<(LaunchState, Closure)> in
        element.1()
        return self.animator.animate(for: element.0)
      }
      .flatMap { element -> Observable<(LaunchState, Closure)> in
        element.1()
        return self.navigator.nextScreen(for: element.0)
      }
      .map { $0.1() }
      .subscribe()
      .disposed(by: bag)



  }
}

