//
//  PostDetailViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 25.07.23.
//

import UIKit

protocol PostDetailViewControllerCoordinator: AnyObject {
  func didTapMoreDetailButton()
  func didSourceButton()
}

final class PostDetailViewController: UIViewController {
  private var postDetailView: PostDetailProtocol
  private weak var coordinator: PostDetailViewControllerCoordinator?

  init(postDetailView: PostDetailProtocol, coordinator: PostDetailViewControllerCoordinator?) {
    self.postDetailView = postDetailView
    self.coordinator = coordinator
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = postDetailView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupButtonsAction()
    isHideTabBar()
  }

  private func setupButtonsAction() {
    postDetailView.onMoreDetailButton = { [weak self] in
      guard let sSelf = self else { return }
      sSelf.coordinator?.didTapMoreDetailButton()
    }

    postDetailView.onSourceButton = { [weak self] in
      guard let sSelf = self else { return }
      sSelf.coordinator?.didSourceButton()
    }
  }

  private func isHideTabBar() {
    tabBarController?.tabBar.isHidden = true
  }
}
