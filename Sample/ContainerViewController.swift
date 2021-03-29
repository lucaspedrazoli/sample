//
//  ContainerViewController.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 27/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class ContainerViewController: NiblessViewController {

  private var contentViewController: UIViewController

  init(content: UIViewController) {
    self.contentViewController = content
    super.init()
    show(content, sender: nil)
  }


  override func show(_ vc: UIViewController, sender: Any?) {
    vc.view.alpha = 0.0
    UIView.animate(withDuration: 1.0) {
      self.contentViewController.view.alpha = 0.0
      self.contentViewController.remove()
      self.contentViewController = vc
      self.add(vc)
      vc.view.alpha = 1.0
    }
  }
}

extension UIViewController {

  var parentContainer: ContainerViewController? {
    return parent as? ContainerViewController
  }

  func add(_ child: UIViewController) {
      addChild(child)
      view.addSubview(child.view)
      child.didMove(toParent: self)
  }

  func remove() {
      guard parent != nil else {
          return
      }

      willMove(toParent: nil)
      view.removeFromSuperview()
      removeFromParent()
  }
}
