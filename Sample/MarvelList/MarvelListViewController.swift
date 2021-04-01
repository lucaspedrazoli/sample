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
  private let heroeList = PublishSubject<[MarvelListItem]>()


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
      .map {
        self.heroeList.onNext($0.heroes)
      }
      .subscribe()
      .disposed(by: bag)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let loading = LoadingView()
    loading.inflate(with: view.frame)
    view = loading
    loading.animate()
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

    heroeList
      .bind(to: rxTableView
        .items(cellIdentifier: MarvelListCell.identifier,
               cellType: MarvelListCell.self)) { (_, item, cell) in
                cell.inflate(with: item)
    }
    .disposed(by: bag)


    rxTableView
      .modelSelected(MarvelListItem.self)
      .map { print("click item \($0)") }
      .subscribe()
      .disposed(by: bag)
  }
}

