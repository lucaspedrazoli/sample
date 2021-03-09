//
//  NiblessNavigationController.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 25/02/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class NiblessNavigationController: UINavigationController {

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable,
    message: "Loading this view controller from a nib is unsupported."
  )

  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  @available(*, unavailable,
    message: "Loading this view controller from a nib is unsupported."
  )

  public required init?(coder aDecoder: NSCoder) {
    fatalError("Loading this view controller from a nib is unsupported.")
  }
}
