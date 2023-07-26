//
//  MyPostsMediator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit

protocol MyPostsMediator {
  func updateController(title: String, navigation: NavigationPortocol)
}
struct MyPostsMediatorImp: MyPostsMediator {
  func updateController(title: String, navigation: NavigationPortocol) {
    guard let myPostViewController = navigation.rootViewController.topViewController as? MyPostsViewController else { return }

    myPostViewController.updateLabel(title: title)
  }
}
