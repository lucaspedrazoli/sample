//
//  GradientLabel.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 25/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class GradientLabel: UILabel {

  private let _font: UIFont?

  init(font: UIFont?, textColor: UIColor) {
    _font = font
    super.init(frame: .zero)
    self.translatesAutoresizingMaskIntoConstraints = false
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  let gradientLayer: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    let colors = [UIColor.black.cgColor,
                  UIColor.white.cgColor,
                  UIColor.black.cgColor]
    gradientLayer.colors = colors
    let locations: [NSNumber] = [0.25, 0.5, 0.75]
    gradientLayer.locations = locations
    return gradientLayer
  }()

  func animate() {
    layoutIfNeeded()
    self.textColor = textColor
    guard let text = text,
      let font = _font else { return }
    let style = NSMutableParagraphStyle()
    style.alignment = .center
    let dict: [NSAttributedString.Key: Any] = [.font: font,
                                               .paragraphStyle: style]
    let image = UIGraphicsImageRenderer(size: bounds.size)
      .image { _ in
        text.draw(in: bounds, withAttributes: dict)
    }

    let maskLayer = CALayer()
    maskLayer.backgroundColor = UIColor.clear.cgColor
    maskLayer.frame = bounds.offsetBy(dx: bounds.size.width, dy: 0)
    maskLayer.contents = image.cgImage
    gradientLayer.mask = maskLayer
    gradientLayer.frame = CGRect(x: -bounds.size.width,
                                 y: bounds.origin.y,
                                 width: 3 * bounds.size.width,
                                 height: bounds.size.height)
    layer.addSublayer(gradientLayer)

    let gradientAnimation = CABasicAnimation(keyPath: "locations")
    gradientAnimation.fromValue = [0.0, 0.0, 0.25]
    gradientAnimation.toValue = [0.75, 1.0, 1.0]
    gradientAnimation.duration = 1.0
    gradientAnimation.repeatCount = Float.infinity
    gradientLayer.add(gradientAnimation, forKey: nil)
  }
}

