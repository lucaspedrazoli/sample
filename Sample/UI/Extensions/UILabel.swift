//
//  UILabel.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 01/04/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

extension UILabel {

  static var selfSizedHeight: UILabel {
    return UILabel(frame: CGRect(x: 0,
                                 y: 0,
                                 width: 0,
                                 height: CGFloat.greatestFiniteMagnitude))
  }
}
