//
//  EmptyStateView.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 20/04/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class EmptyStateView: NiblessView {

  lazy var container: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(red: 249 / 255,
                                   green: 249 / 255,
                                   blue: 249 / 255,
                                   alpha: 0.8)
    view.layer.cornerRadius = 10.0
    return view
  }()

  lazy var emptyIcon: UIImageView = {
    let image = UIImage.local(.emptyBox)
    let imageView = UIImageView(image: image)
    imageView.alpha = 0.1
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  override func addSubviews() {
    addSubview(container)
    container.addSubview(emptyIcon)
  }

  override func installConstraints() {
    var constraints = [
      container.topAnchor.constraint(equalTo: topAnchor, constant: 5),
      container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
      container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
      container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
    ]
    constraints += [
      emptyIcon.widthAnchor.constraint(equalToConstant: 100),
      emptyIcon.heightAnchor.constraint(equalToConstant: 100),
      emptyIcon.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      emptyIcon.centerYAnchor.constraint(equalTo: container.centerYAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
