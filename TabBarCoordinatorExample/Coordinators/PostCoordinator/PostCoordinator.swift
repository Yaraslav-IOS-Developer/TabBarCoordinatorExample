//
//  PostCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit


final class PostCoordinator: CoordinatorProtocol {
  var navigation: NavigationProtocol
  var childCoordinators: [CoordinatorProtocol] = []
  private let factory: MyPostsFactoryProtocol
  private let myPostsMediator: MyPostsMediatorProtocol

  init(
    navigation: NavigationProtocol,
    newPostView: NewPostViewProtocol,
    myPostView: MyPostsViewProtocol,
    factory: MyPostsFactoryProtocol,
    myPostsMediator: MyPostsMediatorProtocol
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
