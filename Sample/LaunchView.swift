//
//  LaunchView.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 19/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class LaunchView: NiblessView {

  private lazy var container: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .black
      return view
  }()

  private lazy var helloMessage: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .white
    label.font = UIFont(name: "Baskerville-Bold", size: 32)
    label.text = "Loading..."
    return label
  }()

  override func addSubviews() {
    addSubview(container)
    container.addSubview(helloMessage)
  }

  override func installConstraints() {
    var constraints = [
      container.topAnchor.constraint(equalTo: self.topAnchor),
      container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: self.trailingAnchor)
    ]
    constraints += [
      helloMessage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
      helloMessage.centerYAnchor.constraint(equalTo: container.centerYAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }
}

