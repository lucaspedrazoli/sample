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
  let bag = DisposeBag()

  public init(viewModel: LaunchViewModel,
              navigator: LaunchNavigator,
              container: LaunchDependencyContainer) {
    self.viewModel = viewModel
    self.container = container
    self.navigator = navigator
    super.init()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  func startAnimation() -> Observable<Void> {
    return Observable.empty()
  }
}

