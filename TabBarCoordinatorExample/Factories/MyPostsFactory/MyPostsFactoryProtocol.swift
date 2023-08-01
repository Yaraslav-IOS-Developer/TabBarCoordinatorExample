//
//  MyPostsFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit


protocol MyPostsFactoryProtocol {
  func makeTabBarItem(navigation: NavigationProtocol)
  func makeMyPostsViewController(coordinator: MyPostsViewControllerDelegate?) -> UIViewController
  func makeNewPostViewController(coordinator: NewPostViewControllerCoordinator?) -> UIViewController
  func makePostDetailsCoordinator(navigation: NavigationProtocol, id: Int, parentCoordinator: ParentCoordinator?) -> CoordinatorProtocol
}

struct MyPostsFactoryImp: MyPostsFactoryProtocol {
  func makeMyPostsViewController(coordinator: MyPostsViewControllerDelegate?) -> UIViewController {
    let layout = UICollectionViewFlowLayout()
    let myPostView = MyPostsView()

    let myPostsViewController = MyPostsViewController(myPostView: myPostView, collectionViewLayout: layout, coordinator: coordinator)
    myPostsViewController.title = "My Posts"

    return myPostsViewController
  }

  func makeTabBarItem(navigation: NavigationProtocol) {
    makeItemTabBar(
      navigation: navigation,
      title: "My Posts",
      image: "list.bullet.rectangle.portrait",
      selectedImage: "list.bullet.rectangle.portrait.fill")
  }

  func makeNewPostViewController(coordinator: NewPostViewControllerCoordinator?) -> UIViewController {
    let newPostView = NewPostView()
    let newPostViewController = NewPostViewController(newPostView: newPostView, coordinator: coordinator)

    return newPostViewController
  }

  func makePostDetailsCoordinator(
    navigation: NavigationProtocol,
    id: Int,
    parentCoordinator: ParentCoordinator?
  ) -> CoordinatorProtocol {
    let factory = PostDetailFactory(id: id)
    let coordinator = PostDetailCoordinator(
      navigation: navigation,
      factory: factory,
      parentCoordinator: parentCoordinator
    )

    return coordinator
  }
}

extension MyPostsFactoryImp: ItemTabBarFactory { }
