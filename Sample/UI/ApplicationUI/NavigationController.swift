//
//  NavigationController.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 29/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class NavigationController: NiblessNavigationController {

  static let shared = NavigationController()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func addRootViewController(_ root: NiblessViewController) {
    viewControllers = [root]
  }
}
