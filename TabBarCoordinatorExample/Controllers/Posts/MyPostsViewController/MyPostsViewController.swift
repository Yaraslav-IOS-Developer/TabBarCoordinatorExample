//
//  MyPostsViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit


protocol MyPostsViewControllerDelegate: AnyObject {
  func didSelectPost(id: Int)
  func didTapAddNewPostButton()
}

final class MyPostsViewController: UIViewController {
  private var myPostView: MyPostsViewProtocol
  private var collectionViewLayout: UICollectionViewFlowLayout
  private weak var coordinator: MyPostsViewControllerDelegate?
  private var counter = 1

  init(
    myPostView: MyPostsViewProtocol,
    collectionViewLayout: UICollectionViewFlowLayout,
    coordinator: MyPostsViewControllerDelegate?
  ) {
    self.myPostView = myPostView
    self.coordinator = coordinator
    self.collectionViewLayout = collectionViewLayout
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = myPostView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }

  private func setupUI() {
    setupNavigationBar()
    setupCollectionViewLayout()
    setupCollectionView()
  }

  private func setupNavigationBar() {
    let newPostBarButtonItem = UIBarButtonItem(systemItem: .add, primaryAction: newPostButtonTapped())
    navigationItem.rightBarButtonItem = newPostBarButtonItem
  }

  private func setupCollectionViewLayout() {
    collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
    collectionViewLayout.scrollDirection = .vertical
  }

  private func setupCollectionView() {
    myPostView.collectionView.dataSource = self
    myPostView.collectionView.delegate = self
    myPostView.collectionView.collectionViewLayout = collectionViewLayout
    registerCell()
  }

  private func registerCell() {
    myPostView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
  }

  private func newPostButtonTapped() -> UIAction {
    return UIAction { [weak self] _ in
      guard let sSelf = self else { return }
      sSelf.coordinator?.didTapAddNewPostButton()
    }
  }

  func updateLabel(title: String) {
    myPostView.updateLabel(title: title)
    counter = counter + 1
    myPostView.collectionView.reloadData()
  }
}

extension MyPostsViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return counter
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

extension MyPostsViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    coordinator?.didSelectPost(id: indexPath.row)
  }
}
