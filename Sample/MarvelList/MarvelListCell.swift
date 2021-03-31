//
//  MarvelListCell.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class MarvelListCell: UITableViewCell {

  lazy var container: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    return view
  }()

  lazy var heroThumb: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 16.0
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  lazy var heroName: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Georgia", size: 30.0)
    label.textAlignment = .justified
    label.textColor = .black
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  func inflate(with item: MarvelListItem) {
    addSubviews()
    installConstraints()
    heroName.text = item.name
    heroThumb.load(path: "")

  }

  private func addSubviews() {
    addSubview(container)
    container.addSubview(heroThumb)
    container.addSubview(heroName)
  }

  private func installConstraints() {

    var constraints = [
      container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      container.topAnchor.constraint(equalTo: self.topAnchor),
      container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ]
    constraints += [
      heroThumb.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
      heroThumb.widthAnchor.constraint(equalToConstant: 100),
      heroThumb.heightAnchor.constraint(equalToConstant: 100),
      heroThumb.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
      heroThumb.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor, constant: -10)
    ]
    constraints += [
      heroName.leadingAnchor.constraint(equalTo: heroThumb.trailingAnchor, constant: 30),
      heroName.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: 10),
      heroName.topAnchor.constraint(equalTo: heroThumb.topAnchor),
      heroName.heightAnchor.constraint(equalTo: heroThumb.heightAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
