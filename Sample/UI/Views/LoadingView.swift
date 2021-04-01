//
//  LoadingView.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 01/04/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class LoadingView: NiblessView {

  private let animationDuration: CFTimeInterval = 0.5

  lazy var container: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .gray
    view.alpha = 0.6
    view.layer.cornerRadius = 10.0
    return view
  }()

  lazy var alertBox: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.layer.borderWidth = 1.0
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = .zero
    view.layer.shadowOpacity = 1.0
    view.layer.shadowRadius = 10
    view.layer.cornerRadius = 10.0
    return view
  }()

  lazy var loadingIcon: UIImageView = {
    let image = UIImage.local(.captain)
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  lazy var loadingLabel: UILabel = {
    let font = UIFont(name: "AmericanTypewriter-Bold", size: 25.0)
    let label = UILabel.selfSizedHeight
    label.font = font
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.textAlignment = .center
    label.text = "Loading..."
    label.sizeToFit()
    return label
  }()

  override func addSubviews() {
    addSubview(container)
    container.addSubview(alertBox)
    alertBox.addSubview(loadingLabel)
    alertBox.addSubview(loadingIcon)
  }

  override func installConstraints() {
    var constraints = [
      container.topAnchor.constraint(equalTo: topAnchor, constant: 5),
      container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
      container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
      container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
    ]
    constraints += [
      alertBox.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.3),
      alertBox.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.6),
      alertBox.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      alertBox.centerYAnchor.constraint(equalTo: container.centerYAnchor)
    ]
    constraints += [
      loadingIcon.widthAnchor.constraint(equalToConstant: 70),
      loadingIcon.heightAnchor.constraint(equalToConstant: 70),
      loadingIcon.centerXAnchor.constraint(equalTo: alertBox.centerXAnchor),
      loadingIcon.centerYAnchor.constraint(equalTo: alertBox.centerYAnchor, constant: -20)
    ]
    constraints += [
      loadingLabel.centerXAnchor.constraint(equalTo: alertBox.centerXAnchor),
      loadingLabel.bottomAnchor.constraint(equalTo: alertBox.bottomAnchor, constant: -10),
      loadingLabel.widthAnchor.constraint(equalTo: alertBox.widthAnchor, multiplier: 0.8),
      loadingLabel.heightAnchor.constraint(greaterThanOrEqualTo: alertBox.heightAnchor, multiplier: 0.3)
    ]
    NSLayoutConstraint.activate(constraints)
  }

  func animate() {
    layoutIfNeeded()
    fadeIcon()
    fadeLabel()
  }

  func present(in view: UIView) {
    view.addSubview(self)
  }

  private func fadeIcon() {
    let fade = CAKeyframeAnimation(keyPath: "opacity")
    fade.values = [0.0, 1.0, 0.0]
    fade.keyTimes = [0.0, 0.5, 1.0]
    fade.duration = animationDuration
    fade.repeatCount = Float.infinity
    loadingIcon.layer.add(fade, forKey: nil)
  }

  private func fadeLabel() {
    let fade = CAKeyframeAnimation(keyPath: "opacity")
    fade.values = [0.0, 1.0, 0.0]
    fade.keyTimes = [0.0, 0.5, 1.0]
    fade.duration = animationDuration
    fade.repeatCount = Float.infinity
    loadingLabel.layer.add(fade, forKey: nil)
  }

}
