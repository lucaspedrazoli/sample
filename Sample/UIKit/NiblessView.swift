//
//  NiblessView.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 25/02/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class NiblessView: UIView {

  public override init(frame: CGRect) {
    super.init(frame: frame)
  }

  @available(*, unavailable,
    message: "Loading this view controller from a nib is unsupported."
  )

  public required init?(coder aDecoder: NSCoder) {
    fatalError("Loading this view from a nib is unsupported.")
  }
}
