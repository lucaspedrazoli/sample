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
  private let viewModel: MarvelListViewModel
  private let bag = DisposeBag()
  private let list = PublishSubject<MarvelList>()


  init(view: MarvelListView,
       viewModel: MarvelListViewModel) {
    self.viewModel = viewModel
    self.marvelListView = view
    super.init()
  }

  override func loadView() {
    super.loadView()
    setupTableView()
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewModel
      .load(for: .loading)
      .map { print($0) }
      .subscribe()
      .disposed(by: bag)
  }

  private func setupUI() {
    marvelListView.inflate(with: view.frame)
    view = marvelListView
    marvelListView.registerCell(MarvelListCell.self,
                                identifier: MarvelListCell.identifier)
  }

  private func setupTableView() {
    let rxTableView = marvelListView.tableView.rx

    rxTableView
      .setDelegate(self)
      .disposed(by: bag)

    //list.bind(to: rxTableView.items(Marve))

    rxTableView
      .modelSelected(MarvelListItem.self)
      .map { print("click item \($0)") }
      .subscribe()
      .disposed(by: bag)
  }
}

