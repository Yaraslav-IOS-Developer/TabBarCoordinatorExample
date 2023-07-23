//
//  MyPostsFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit

protocol MyPostsFactory {
  func makeTabBarItem(navigation: UINavigationController)
  func makeMyPostsViewController(coordinator: MyPostsViewControllerDelegate?) -> UIViewController
  func makeNewPostViewController(coordinator: NewPostViewControllerCoordinator?) -> UIViewController
}

struct MyPostsFactoryImp: MyPostsFactory {
  func makeMyPostsViewController(coordinator: MyPostsViewControllerDelegate?) -> UIViewController {
    let layout = UICollectionViewFlowLayout()
    let myPostView = MyPostsView()

    let myPostsViewController = MyPostsViewController(myPostView: myPostView, collectionViewLayout: layout, coordinator: coordinator)
    myPostsViewController.title = "My Posts"

    return myPostsViewController
  }

  func makeTabBarItem(navigation: UINavigationController) {
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
}

extension MyPostsFactoryImp: ItemTabBarFactory { }
