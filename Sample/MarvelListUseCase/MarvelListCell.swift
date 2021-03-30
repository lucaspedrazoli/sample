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
    view.backgroundColor = .black
    return view
  }()

  lazy var heroThumb: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  lazy var heroName: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Georgia", size: 16.0)
    label.textAlignment = .left
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  func inflate(with item: MarvelListItem) {
    heroName.text = item.name
    heroThumb.load(path: item.thumbnailURL)
    addSubviews()
    installConstraints()
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
      container.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ]
    constraints += [
      heroThumb.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
      heroThumb.widthAnchor.constraint(equalToConstant: 50),
      heroThumb.heightAnchor.constraint(equalToConstant: 50),
      heroThumb.topAnchor.constraint(equalTo: container.topAnchor, constant: 10)
    ]
    constraints += [
      heroThumb.leadingAnchor.constraint(equalTo: heroThumb.trailingAnchor, constant: 15),
      heroName.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: 10),
      heroThumb.centerYAnchor.constraint(equalTo: heroThumb.centerYAnchor),
      heroName.heightAnchor.constraint(equalTo: heroThumb.heightAnchor, multiplier: 0.8)
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
