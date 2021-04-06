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

class MarvelListViewController<
  Animator: StateControllerType
  >: NiblessViewController, UITableViewDelegate
  where Animator.State == MarvelListState {

  private let marvelListView: MarvelListView
  private let viewModel: MarvelListViewModel
  private let bag = DisposeBag()
  private let heroeList = PublishRelay<[MarvelListItem]>()
  private let loadingView = LoadingView()


  init(view: MarvelListView,
       viewModel: MarvelListViewModel,
       animator: Animator) {
    self.viewModel = viewModel
    self.marvelListView = view
    super.init()
  }

  override func loadView() {
    super.loadView()
    bindTableView()
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
    loadingView.inflate(with: view.frame)
    loadingView.present(in: view)
    loadingView.animate()
    viewModel
      .load(for: .loading)
      .map {
        self.heroeList.accept($0.heroes)
        self.loadingView.remove()
      }
      .subscribe()
      .disposed(by: bag)
  }

  private func setupUI() {
    marvelListView.inflate(with: view.frame)
    view = marvelListView
    marvelListView.registerCell(MarvelListCell.self,
                                identifier: MarvelListCell.identifier)
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

