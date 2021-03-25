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
  private var rotation = UIViewPropertyAnimator(duration: 1.5,
                                                curve: .linear)
  private var fade = UIViewPropertyAnimator(duration: 1.5,
                                            curve: .linear)
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
    rotateIcon()
  }

  func stopAnimations() {
    loadingLabel.stopAnimation()
    //fade.stopAnimation(true)
    rotation.pauseAnimation()
  }

  private func rotateIcon() {
    rotation.addAnimations {
      self.loadingIcon.transform = CGAffineTransform(rotationAngle: .pi)
    }
    rotation.addAnimations{
      self.loadingIcon.transform = CGAffineTransform(rotationAngle: .pi * 2)
    }
    rotation.addCompletion { _ in
      self.rotateIcon()
    }
    rotation.startAnimation()
  }

  private func fadeIcon() {
    fade.addAnimations { [weak self] in
      guard let self = self else { return }
      UIView.animateKeyframes(withDuration: self.animationDuration, delay: 0.0, animations: {
        UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
          self.loadingIcon.alpha = 1.0
        }

        UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
          self.loadingIcon.alpha = 0.0
        }
      })
    }

    fade.addCompletion { _ in
      self.fadeIcon()
    }
    fade.startAnimation()
  }
}

