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
  private var timeout: CFTimeInterval {
    return animationDuration * 4
  }
  private var animations: Set<UIViewPropertyAnimator> = []

  lazy var container: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .black
      return view
  }()

  lazy var loadingIcon: UIImageView = {
    let image = UIImage(named: "coffee-cup")
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
      loadingIcon.widthAnchor.constraint(equalToConstant: 50),
      loadingIcon.heightAnchor.constraint(equalToConstant: 50),
      loadingIcon.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      loadingIcon.centerYAnchor.constraint(equalTo: container.centerYAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }

  func animate() {
    layoutIfNeeded()
    loadingLabel.animate()
    fadeIcon()
    //rotateIcon()
  }

  func stopAnimations() {
   // loadingLabel.stopAnimation()
   // _ = animations.map { $0.stopAnimation(false) }
  }

  private func rotateIcon() {
    let rotation = UIViewPropertyAnimator(duration: timeout,
                                          curve: .linear)

    rotation
      .addAnimations {
        UIView
          .animateKeyframes(withDuration: self.timeout,
                            delay: 0.0,
                            options: [.repeat],
                            animations: {
                              UIView
                                .addKeyframe(withRelativeStartTime: 0.0,
                                             relativeDuration: 0.25) {
                                              self.loadingIcon
                                                .transform = CGAffineTransform(rotationAngle: .pi)
                              }
                              UIView.addKeyframe(withRelativeStartTime: 0.25,
                                                 relativeDuration: 0.25) {
                                                    self.loadingIcon
                                                      .transform = CGAffineTransform(rotationAngle: .pi * 2)
                              }

      })
    }
    animations.insert(rotation)
    rotation.startAnimation()
  }

  private func fadeIcon() {
    let fadeAnimation = CAKeyframeAnimation(keyPath: "opacity")
    fadeAnimation.values = [0.0, 1.0, 0.0]
    fadeAnimation.keyTimes = [0.0, 0.5, 1.0]
    fadeAnimation.duration = animationDuration
    fadeAnimation.repeatCount = Float.infinity
    loadingIcon.layer.add(fadeAnimation, forKey: nil)
  }
}
