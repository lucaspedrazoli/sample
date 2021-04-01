//
//  UIImage.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 01/04/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

extension UIImage {
  static func local(_ name: ImageFileName) -> UIImage? {
    return UIImage(named: name.rawValue)
  }
}
