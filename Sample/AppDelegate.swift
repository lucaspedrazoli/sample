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

  let container = MainDependencyContainer()
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let launchViewController = container.makeLaunchViewController()
    let containerViewController = ContainerViewController(content: launchViewController)
    window = createWindow(root: containerViewController)
    window?.makeKeyAndVisible()
    return true
  }

  private func createWindow(root: UIViewController) -> UIWindow? {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.makeKeyAndVisible()
    window.rootViewController = root
    return window
  }
}

