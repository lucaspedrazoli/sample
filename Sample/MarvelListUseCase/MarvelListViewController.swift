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

  private let marvelListView: MarvelListView
  private let bag = DisposeBag()
  private let items = PublishSubject<[MarvelListItem]>()


  init(view: MarvelListView) {
    self.marvelListView = view
    super.init()
  }

  override func loadView() {
    super.loadView()
    marvelListView.tableView.rx
      .setDelegate(self)
      .disposed(by: bag)
    bindTableView()
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let marvelItems = MarvelListItem.fakeData()
    items.onNext(marvelItems)
  }

  private func setupUI() {
    marvelListView.inflate(with: view.frame)
    view = marvelListView
    marvelListView.registerCell(MarvelListCell.self,
                                identifier: MarvelListCell.identifier)
  }

  private func bindTableView() {
    items.bind(to: marvelListView.tableView.rx.items(cellIdentifier: MarvelListCell.identifier,
                                      cellType: MarvelListCell.self)) { (row,item,cell) in
                                        cell.inflate(with: item)
    }.disposed(by: bag)

    marvelListView.tableView.rx.modelSelected(MarvelListItem.self).map {
      print("click item \($0)")
      }.subscribe().disposed(by: bag)
  }
}

