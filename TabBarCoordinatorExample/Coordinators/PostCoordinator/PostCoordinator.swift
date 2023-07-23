//
//  PostCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit

final class PostCoordinator: CoordinatorProtocol {
  var navigation: UINavigationController
  private let factory: MyPostsFactory
  private let myPostsMediator: MyPostsMediator

  init(
    navigation: UINavigationController,
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
    
  }

  func didTapAddNewPostButton() {
    let newPostViewController = factory.makeNewPostViewController(coordinator: self)
    navigation.present(newPostViewController, animated: true)
  }
}

extension PostCoordinator: NewPostViewControllerCoordinator  {
  func didSaveNewPost(title: String) {
    navigation.dismiss(animated: true)
    myPostsMediator.updateController(title: title, navigation: navigation)
  }
}
