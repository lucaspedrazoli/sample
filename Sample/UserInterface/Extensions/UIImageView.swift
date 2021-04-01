//
//  UIImageView.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

extension UIImageView {
  func load(url: String) {
    guard let url = URL(string: url) else { return }
    DispatchQueue.global().async { [weak self] in
      guard let data = try? Data(contentsOf: url) else { return }
      guard let image = UIImage(data: data) else { return }
      DispatchQueue.main.async {
        self?.image = image
      }
    }
  }
}
