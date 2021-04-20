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

    }
  }
}


class MarvelListViewController: NiblessViewController, UITableViewDelegate {

  private let marvelListView: MarvelListView
  private let viewModel: MarvelListViewModel
  private let bag = DisposeBag()
  private let heroeList = BehaviorRelay<[MarvelListItem]>(value: [])
  private let loadingView = LoadingView()

  lazy var emptyStateView: UIView = {
    let view = UIView(frame: UIScreen.main.bounds)
    view.backgroundColor = .black
    let label = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
    label.text = "EMPTY"
    label.textColor = .white
    view.addSubview(label)
    return view
  }()

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
      .map(pushItems)
      .subscribe()
      .disposed(by: bag)
  }

  private func bindViews() {
    heroeList
      .asDriver()
      .filter { $0.isEmpty }
      .map { _ in return "message" }
      .drive(onNext: showEmptyState)
      .disposed(by: bag)
  }

  private func setupUI() {
    marvelListView.inflate(with: view.frame)
    view = marvelListView
    marvelListView.registerCell(MarvelListCell.self,
                                identifier: MarvelListCell.identifier)
  }

  private func showEmptyState(_ message: String) {
    view.addSubview(emptyStateView)
  }

  private func pushItems(from list: MarvelList) {
    //heroeList.accept(list.heroes)
    heroeList.accept([])
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

