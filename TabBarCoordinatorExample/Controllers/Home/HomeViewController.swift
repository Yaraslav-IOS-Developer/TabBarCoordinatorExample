//
//  HomeViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 25.07.23.
//

import UIKit

protocol HomeViewControllerCoordinator: AnyObject {
  func didSelectPost(id: Int)
}

final class HomeViewController: UIViewController {
  private var homeView: HomeViewProtocol
  private var collectionViewLayout: UICollectionViewFlowLayout
  private weak var coordinator: HomeViewControllerCoordinator?

  init(
    homeView: HomeViewProtocol,
    collectionViewLayout: UICollectionViewFlowLayout,
    coordinator: HomeViewControllerCoordinator?) {
    self.homeView = homeView
    self.collectionViewLayout = collectionViewLayout
    self.coordinator = coordinator
    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    view = homeView as? UIView
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    isShowTabBar()
  }

  private func setupUI() {
    setupCollectionViewLayout()
    setupCollectionView()
  }

  private func setupCollectionViewLayout() {
    collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
    collectionViewLayout.scrollDirection = .vertical
  }

  private func setupCollectionView() {
    homeView.collectionView.dataSource = self
    homeView.collectionView.delegate = self
    homeView.collectionView.collectionViewLayout = collectionViewLayout
    registerCell()
  }

  private func registerCell() {
    homeView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
  }

  private func isShowTabBar() {
    tabBarController?.tabBar.isHidden = false
  }
}

extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    var configuration = UIListContentConfiguration.cell()
    configuration.text = "Hello"
    configuration.secondaryText = "there"
    configuration.image = UIImage(systemName: "photo")
    cell.contentConfiguration = configuration
    cell.backgroundColor = .systemGroupedBackground

    return cell
  }
}

extension HomeViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    coordinator?.didSelectPost(id: indexPath.row)
  }
}
