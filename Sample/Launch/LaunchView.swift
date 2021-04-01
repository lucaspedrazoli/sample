//
//  LaunchView.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 19/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//
import UIKit

class LaunchView: NiblessView {

  private let animationDuration: CFTimeInterval = 1.5

  lazy var container: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .black
      return view
  }()

  lazy var loadingIcon: UIImageView = {
    let image = UIImage.local(.superhero)
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.alpha = 0.0
    return imageView
  }()

  lazy var loadingLabel: GradientLabel = {
    let font = UIFont(name: "HelveticaNeue-Thin",size: 41.0)
    let label = GradientLabel(font: font,
                              textColor: .white,
                              duration: animationDuration)
    label.text = "Loading..."
    return label
  }()

  override func addSubviews() {
    addSubview(container)
    container.addSubview(loadingLabel)
    container.addSubview(loadingIcon)
  }

  override func installConstraints() {
    var constraints = [
      container.topAnchor.constraint(equalTo: self.topAnchor),
      container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: self.trailingAnchor)
    ]
    constraints += [
      loadingLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      loadingLabel.bottomAnchor.constraint(equalTo: container.safeAreaLayoutGuide.bottomAnchor),
      loadingLabel.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.8),
      loadingLabel.heightAnchor.constraint(equalToConstant: 50)
    ]
    constraints += [
      loadingIcon.widthAnchor.constraint(equalToConstant: 90),
      loadingIcon.heightAnchor.constraint(equalToConstant: 90),
      loadingIcon.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      loadingIcon.centerYAnchor.constraint(equalTo: container.centerYAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }

  func animate() {
    layoutIfNeeded()
    loadingLabel.animate()
    fadeIcon()
    rotateIcon()
  }

  func stopAnimations() {
    loadingLabel.stopAnimation()
    loadingLabel.alpha = 0.0
    loadingIcon.layer.removeAllAnimations()
    loadingIcon.alpha = 1.0
  }

  private func rotateIcon() {
    let rotate = CAKeyframeAnimation(keyPath: "transform.rotation.z")
    rotate.values = [0.0, CGFloat.pi, CGFloat.pi * 2]
    rotate.keyTimes = [0.0, 0.5, 1.0]
    rotate.duration = animationDuration
    rotate.repeatCount = Float.infinity
    loadingIcon.layer.add(rotate, forKey: nil)
  }

  private func fadeIcon() {
    let fade = CAKeyframeAnimation(keyPath: "opacity")
    fade.values = [0.0, 1.0, 0.0]
    fade.keyTimes = [0.0, 0.5, 1.0]
    fade.duration = animationDuration
    fade.repeatCount = Float.infinity
    loadingIcon.layer.add(fade, forKey: nil)
  }
}
