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
    Navigator: StateControllerType
  >: NiblessViewController
  where
  Navigator.State == LaunchState {

  private let dependencyContainer: LaunchDependencyContainer
  private let launchView: LaunchView
  private var viewModel: LaunchViewModel
  private var navigator: Navigator

  let bag = DisposeBag()

  public init(
    container: LaunchDependencyContainer,
    viewModel: LaunchViewModel,
    navigator: Navigator,
    launchView: LaunchView) {
    self.launchView = launchView
    self.viewModel = viewModel
    self.dependencyContainer = container
    self.navigator = navigator
    super.init()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
    viewModel
      .loadSession(with: launchView.animate)
      .map(navigator.perform)
      .subscribe(onCompleted: { [weak self] in
        self?.launchView.stopAnimations()
      })
      .disposed(by: bag)
  }

  private func setupUI() {
    launchView.inflate(with: view.frame)
    view = launchView
  }

  private func signedInnavigation() {
    let listViewController = self.dependencyContainer.makeListViewController()
    self.show(listViewController, sender: nil)
  }

  private func notSignedInnavigation() {
    launchView.stopAnimations()
  }
}

