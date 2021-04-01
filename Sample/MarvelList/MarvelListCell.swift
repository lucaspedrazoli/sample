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
    let label = UILabel.selfSizedHeight
    label.font = UIFont(name: "Georgia", size: 20.0)
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.textColor = .black
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    label.sizeToFit()
    return label
  }()

  func inflate(with item: MarvelListItem) {
    addSubviews()
    installConstraints()
    heroName.text = item.name
    heroThumb.load(url: item.imageURL(size: .standardMedium))

  }

  private func addSubviews() {
    addSubview(container)
    container.addSubview(heroThumb)
    container.addSubview(heroName)
  }

  private func installConstraints() {

    var constraints = [
      container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
      container.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
    ]
    constraints += [
      heroThumb.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      heroThumb.widthAnchor.constraint(equalToConstant: 100),
      heroThumb.heightAnchor.constraint(equalToConstant: 100),
      heroThumb.topAnchor.constraint(equalTo: container.topAnchor),
      heroThumb.bottomAnchor.constraint(lessThanOrEqualTo: container.bottomAnchor)
    ]
    constraints += [
      heroName.leadingAnchor.constraint(equalTo: heroThumb.trailingAnchor, constant: 10),
      heroName.trailingAnchor.constraint(equalTo: container.trailingAnchor),
      heroName.topAnchor.constraint(equalTo: heroThumb.topAnchor),
      heroName.heightAnchor.constraint(greaterThanOrEqualTo: heroThumb.heightAnchor,
                                       multiplier: 0.3)
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
