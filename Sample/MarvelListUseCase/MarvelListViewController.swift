//
//  MarvelListViewController.swift
//  Sample
//
//  Created by Lucas Pedrazoli on 29/03/21.
//  Copyright © 2021 Lucas Pedrazoli. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MarvelListViewController: NiblessViewController, UITableViewDelegate {

  private let tableView = UITableView(frame: UIScreen.main.bounds)
  private let bag = DisposeBag()
  private let items = PublishSubject<[MarvelListItem]>()

  override func loadView() {
    super.loadView()
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.rx.setDelegate(self).disposed(by: bag)
    view.addSubview(tableView)
    bindTableView()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let marvelItems = MarvelListItem.fakeData()
    items.onNext(marvelItems)
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }

  private func bindTableView() {
    tableView.register(MarvelListCell.self, forCellReuseIdentifier: MarvelListCell.identifier)
    items.bind(to: tableView.rx.items(cellIdentifier: MarvelListCell.identifier,
                                      cellType: MarvelListCell.self)) { (row,item,cell) in
                                        cell.inflate(with: item)
    }.disposed(by: bag)

    tableView.rx.modelSelected(MarvelListItem.self).map {
      print("click item \($0)")
      }.subscribe().disposed(by: bag)
  }
}

