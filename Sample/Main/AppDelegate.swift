//
//  AppDelegate.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 25/02/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let container = MainDependencyContainer()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    setupNavigationController()
    window = createWindow(root: NavigationController.shared)
    window?.makeKeyAndVisible()
    return true
  }

  private func setupNavigationController() {
    let launchViewController = container.makeLaunchViewController()
    let containerViewController = ContainerViewController(content: launchViewController)
    NavigationController.shared.addRootViewController(containerViewController)
  }

  private func createWindow(root: UIViewController) -> UIWindow? {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.makeKeyAndVisible()
    window.rootViewController = root
    return window
  }
}

