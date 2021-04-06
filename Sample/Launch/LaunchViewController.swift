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
    Navigator: StateControllerType,
    Animator: StateControllerType
  >: NiblessViewController
  where
  Navigator.State == LaunchState,
  Animator.State == LaunchState {

  private let dependencyContainer: LaunchDependencyContainer
  private let launchView: LaunchView
  private var viewModel: LaunchViewModel
  private var navigator: Navigator
  private var animator: Animator

  let bag = DisposeBag()

  public init(
    container: LaunchDependencyContainer,
    viewModel: LaunchViewModel,
    navigator: Navigator,
    animator: Animator,
    launchView: LaunchView) {
    self.launchView = launchView
    self.viewModel = viewModel
    self.dependencyContainer = container
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
    navigationController?.setNavigationBarHidden(true, animated: true)
    animator
      .perform(for: .loading)
      .flatMap(viewModel.loadSession)
      .flatMap(navigator.perform)
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
    launchView.animate()
    completion()
  }

  private func signedInnavigation(completion: @escaping () -> Void) {
    launchView.stopAnimations()
    completion()
    let listViewController = self.dependencyContainer.makeListViewController()
    self.parentContainer?.show(listViewController, sender: nil)
  }

  private func notSignedInnavigation(completion: @escaping () -> Void) {
    launchView.stopAnimations()
    completion()
  }
}

