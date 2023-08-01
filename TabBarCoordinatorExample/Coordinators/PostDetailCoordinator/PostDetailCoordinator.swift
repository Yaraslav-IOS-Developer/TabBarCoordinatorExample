//
//  PostDetailCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 25.07.23.
//

import UIKit


final class PostDetailCoordinator: CoordinatorProtocol {
  var navigation: NavigationProtocol
  private var factory: PostDetailFactoryProtocol
  private weak var parentCoordinator: ParentCoordinator?

  init(
    navigation: NavigationProtocol,
    factory: PostDetailFactoryProtocol,
    parentCoordinator: ParentCoordinator?
  ) {
    self.navigation = navigation
    self.factory = factory
    self.parentCoordinator = parentCoordinator
  }

  func start() {
    let postDetailViewController = factory.makePostDetailViewController(delegate: self, coordinator: self)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(postDetailViewController, animate: true) { [weak self] in
      guard let sSelf = self else { return }
      sSelf.parentCoordinator?.removeChildCoordinators(sSelf)
    }
  }
}

extension PostDetailCoordinator: PostDetailDelegate {
  func onPhotoButton() {
    let postDetailPhotoViewController = factory.makePostDetailPhotoViewController()
    navigation.present(postDetailPhotoViewController, animate: true)
  }
}

extension PostDetailCoordinator: PostDetailViewControllerCoordinator {
  func didTapMoreDetailButton() {
    let moreDetailViewController = factory.makeMoreDetailViewController()
    moreDetailViewController.modalPresentationStyle = .popover
    navigation.present(moreDetailViewController, animate: true)
  }

  func didSourceButton() {
    let postDetailSourceViewController = factory.makePostDetailSourceViewController()  
    navigation.pushViewController(postDetailSourceViewController, animated: true)
  }
}
