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
    Animator: AnimatorType
  >: NiblessViewController
  where
  Navigator.State == LaunchState,
  Animator.State == LaunchState {

  let container: LaunchDependencyContainer
  let launchView: LaunchView
  var viewModel: LaunchViewModel
  var navigator: Navigator
  var animator: Animator

  let bag = DisposeBag()

  public init(
    container: LaunchDependencyContainer,
    viewModel: LaunchViewModel,
    navigator: Navigator,
    animator: Animator,
    launchView: LaunchView) {
    self.launchView = launchView
    self.viewModel = viewModel
    self.container = container
    self.navigator = navigator
    self.animator = animator
    super.init()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupAnimator()
    setupNavigator()
    setupUI()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    animator
      .animate(for: .loading)
      .flatMap(viewModel.loadSession)
      .flatMap(navigator.navigate)
      .subscribe()
      .disposed(by: bag)
  }

  private func setupUI() {
    launchView.inflate(with: view.frame)
    view = launchView
  }

  private func setupAnimator() {
    animator.actions[.loading] = loadingAnimation
  }

  private func setupNavigator() {
    navigator.actions[.signedIn] = signedInnavigation
    navigator.actions[.notSignedIn] = notSignedInnavigation
  }

  private func loadingAnimation(completion: @escaping () -> Void) {
    print("loadingAnimation")
    launchView.animate()
    completion()
  }

  private func signedInnavigation(completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { [weak self] in
      print("signedInnavigation")
      self?.launchView.stopAnimations()
      completion()
    }
  }

  private func notSignedInnavigation(completion: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { [weak self] in
      print("notSignedInnavigation")
      self?.launchView.stopAnimations()
      completion()
    }
  }
}

