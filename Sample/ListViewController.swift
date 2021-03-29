//
//  ListViewController.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 29/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListViewController: NiblessViewController, UITableViewDelegate {

  struct Object {
    let name: String
    let role: String
  }

  private let tableView = UITableView(frame: UIScreen.main.bounds)
  private let bag = DisposeBag()
  private let items = PublishSubject<[Object]>()


  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rx.setDelegate(self).disposed(by: bag)
    view.addSubview(tableView)
    bindTableView()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let object = Object(name: "foo", role: "bar")
    items.onNext([object])
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 30
  }

  private func bindTableView() {
    tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
    items.bind(to: tableView.rx.items(cellIdentifier: "CustomCell", cellType: CustomCell.self)) { (row,item,cell) in
      cell.inflate(with: item)
    }.disposed(by: bag)

    tableView.rx.modelSelected(Object.self).map {
      print("click item \($0)")
      }.subscribe().disposed(by: bag)
  }
}


class CustomCell: UITableViewCell {

  func inflate(with item: ListViewController.Object) {
    backgroundColor = .yellow
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
    label.text = item.name
    addSubview(label)
  }
}

