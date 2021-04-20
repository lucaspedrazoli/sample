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

extension Reactive where Base: MarvelListView {
  var isLoading: Binder<Bool> {
    return Binder(self.base) { view, isLoading in
      isLoading ? view.showEmptyState(with: "") : view.removeEmptyState()
    }
  }
}


class MarvelListViewController: NiblessViewController, UITableViewDelegate {

  private let marvelListView: MarvelListView
  private let viewModel: MarvelListViewModel
  private let bag = DisposeBag()
  private let heroeList = BehaviorRelay<[MarvelListItem]>(value: [])
  private let loadingView = LoadingView()

  init(view: MarvelListView,
       viewModel: MarvelListViewModel){
    self.viewModel = viewModel
    self.marvelListView = view
    super.init()
  }

  override func loadView() {
    super.loadView()
    bindTableView()
    bindViews()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewModel
      .load(with: showLoading)
      .observe(on: MainScheduler.instance)
      .subscribe(onNext: pushItems)
      .disposed(by: bag)

  }

  private func bindViews() {
    heroeList
      .asDriver()
      .map { $0.isEmpty }
      .drive(marvelListView.rx.isLoading)
      .disposed(by: bag)
  }

  private func setupUI() {
    marvelListView.inflate(with: view.frame)
    view = marvelListView
    marvelListView.registerCell(MarvelListCell.self,
                                identifier: MarvelListCell.identifier)
  }

  private func pushItems(from list: MarvelList) {
    heroeList.accept(list.heroes)
    marvelListView.removeEmptyState()
    //heroeList.accept([])
    loadingView.remove()
  }

  private func showLoading() {
    loadingView.inflate(with: view.frame)
    loadingView.present(in: view)
    loadingView.animate()
  }

  private func bindTableView() {
    let rxTableView = marvelListView.tableView.rx

    rxTableView
      .setDelegate(self)
      .disposed(by: bag)

    heroeList
      .asDriver(onErrorJustReturn: [])
      .drive(rxTableView.items(cellIdentifier: MarvelListCell.identifier,
                               cellType: MarvelListCell.self )) {  (_, item, cell) in
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

