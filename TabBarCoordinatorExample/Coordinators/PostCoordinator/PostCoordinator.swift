//
//  PostCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit

final class PostCoordinator: CoordinatorProtocol {
  var navigation: NavigationPortocol
  var childCoordinators: [CoordinatorProtocol] = []
  private let factory: MyPostsFactory
  private let myPostsMediator: MyPostsMediator

  init(
    navigation: NavigationPortocol,
    newPostView: NewPostView,
    myPostView: MyPostsView,
    factory: MyPostsFactory,
    myPostsMediator: MyPostsMediator
  ) {
    self.navigation = navigation
    self.factory = factory
    self.myPostsMediator = myPostsMediator
  }

  func start() {
    let myPostViewController = factory.makeMyPostsViewController(coordinator: self)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(myPostViewController, animated: true)
    factory.makeTabBarItem(navigation: navigation)
  }
}

extension PostCoordinator: MyPostsViewControllerDelegate {
  func didSelectPost(id: Int) {
    let postDetailCoordinator = factory.makePostDetailsCoordinator(navigation: navigation, id: id, parentCoordinator: self)
    addChildCoordinator(postDetailCoordinator)
  }

  func didTapAddNewPostButton() {
    let newPostViewController = factory.makeNewPostViewController(coordinator: self)
    navigation.present(newPostViewController, animate: true)
  }
}

extension PostCoordinator: NewPostViewControllerCoordinator  {
  func didSaveNewPost(title: String) {
    navigation.dismiss(animate: true)
    myPostsMediator.updateController(title: title, navigation: navigation)
  }
}

extension PostCoordinator: ParentCoordinator { }
