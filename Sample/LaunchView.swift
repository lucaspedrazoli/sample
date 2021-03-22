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
      view.backgroundColor = .cyan
      return view
  }()

  private lazy var helloMessage: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Launch app test"
    return label
  }()

  override func setup() {
    addSubview(container)
    container.addSubview(helloMessage)
  }

  override func installConstraints() {
    var constraints = [NSLayoutConstraint]()
    constraints.append(container.topAnchor.constraint(equalTo: superview!.topAnchor))
    constraints.append(container.bottomAnchor.constraint(equalTo: superview!.bottomAnchor))
    constraints.append(container.leadingAnchor.constraint(equalTo: superview!.leadingAnchor))
    constraints.append(container.trailingAnchor.constraint(equalTo: superview!.trailingAnchor))
    NSLayoutConstraint.activate(constraints)
  }
}

