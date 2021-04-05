//
//  MarvelListView.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 30/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit

class MarvelListView: NiblessView {

  lazy var container: UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.backgroundColor = .white
      return view
  }()

  lazy var imageHeader: UIImageView = {
    let image = UIImage.local(.marvelLogo)
    let imageView = UIImageView(image: image)
    imageView.layer.borderWidth = 0.5
    imageView.layer.borderColor = UIColor.black.cgColor
    imageView.layer.cornerRadius = 10
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .clear
    tableView.rowHeight = UITableView.automaticDimension
    return tableView
  }()

  func registerCell(_ cell: AnyClass, identifier: String) {
    tableView.register(cell, forCellReuseIdentifier: identifier)
  }

  override func addSubviews() {
    self.addSubview(container)
    container.addSubview(imageHeader)
    container.addSubview(tableView)
  }

  override func installConstraints() {
    var constraints = [
      container.topAnchor.constraint(equalTo: self.topAnchor),
      container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      container.trailingAnchor.constraint(equalTo: self.trailingAnchor)
    ]
    constraints += [
      imageHeader.topAnchor.constraint(equalTo: container.topAnchor, constant: 10),
      imageHeader.heightAnchor.constraint(equalToConstant: 150),
      imageHeader.widthAnchor.constraint(equalToConstant: 300),
      imageHeader.centerXAnchor.constraint(equalTo: container.centerXAnchor),
    ]
    constraints += [
      tableView.topAnchor.constraint(equalTo: imageHeader.bottomAnchor, constant: 10),
      tableView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: container.trailingAnchor)
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
