//
//  LoadingViewController.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 01/04/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class LoadingViewController: NiblessViewController {

  fileprivate let loadingView = LoadingView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    loadingView.inflate(with: view.frame)
    view = loadingView
  }
}


fileprivate class LoadingView: NiblessView {

  private let animationDuration: CFTimeInterval = 0.5

  lazy var container: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .gray
    view.backgroundColor?.withAlphaComponent(0.3)
    return view
  }()

  lazy var loadingIcon: UIImageView = {
    let image = UIImage.local(.captain)
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  lazy var loadingLabel: UILabel = {
    let font = UIFont(name: "AmericanTypewriter-Bold", size: 30.0)
    let label = UILabel.selfSizedHeight
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.textAlignment = .center
    label.text = "Loading..."
    label.sizeToFit()
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
      loadingIcon.widthAnchor.constraint(equalToConstant: 90),
      loadingIcon.heightAnchor.constraint(equalToConstant: 90),
      loadingIcon.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      loadingIcon.centerYAnchor.constraint(equalTo: container.centerYAnchor)
    ]
    constraints += [
      loadingLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      loadingLabel.topAnchor.constraint(equalTo: loadingIcon.bottomAnchor, constant: 10),
      loadingLabel.widthAnchor.constraint(equalToConstant: 200),
      loadingLabel.heightAnchor.constraint(equalToConstant: 30)
    ]
    NSLayoutConstraint.activate(constraints)
  }

  func animate() {
    layoutIfNeeded()
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
