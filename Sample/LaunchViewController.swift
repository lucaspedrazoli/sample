//
//  ViewController.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 25/02/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit
import RxSwift

class LaunchViewController: NiblessViewController {

  var viewModel: LaunchViewModel
  let container: LaunchDependencyContainer
  let navigator: LaunchNavigator
  let animator: LaunchAnimator
  let bag = DisposeBag()

  public init(viewModel: LaunchViewModel,
              navigator: LaunchNavigator,
              container: LaunchDependencyContainer,
              animator: LaunchAnimator) {
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

