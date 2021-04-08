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
  private var animator: Animator

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
       viewModel: MarvelListViewModel,
       animator: Animator) {
    self.viewModel = viewModel
    self.marvelListView = view
    self.animator = animator
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
    viewModel
      .load(for: .loading)
      .flatMap(pushItems)
      .flatMap(animator.perform)
      .subscribe()
      .disposed(by: bag)
  }

  private func setupUI() {
    marvelListView.inflate(with: view.frame)
    view = marvelListView
    marvelListView.registerCell(MarvelListCell.self,
                                identifier: MarvelListCell.identifier)
  }

  private func showEmptyState(_ completion: @escaping () -> Void) {
    view.addSubview(emptyStateView)
    completion()
  }

  private func pushItems(from list: MarvelList) -> Observable<MarvelListState> {
    heroeList.accept(list.heroes)
    return .just(.loadedUp)
  }

  private func loadingAnimation(_ completion: @escaping () -> Void) {
    loadingView.inflate(with: view.frame)
    loadingView.present(in: view)
    loadingView.animate()
    completion()
  }

  private func loadedUpAnimation(_ completion: @escaping () -> Void) {
    loadingView.remove()
    completion()
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

