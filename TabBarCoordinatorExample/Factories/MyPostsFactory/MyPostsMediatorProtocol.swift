//
//  MyPostsMediator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit


protocol MyPostsMediatorProtocol {
  func updateController(title: String, navigation: NavigationProtocol)
}

struct MyPostsMediatorImp: MyPostsMediatorProtocol {
  func updateController(title: String, navigation: NavigationProtocol) {
    guard let myPostViewController = navigation.rootViewController.topViewController as? MyPostsViewController else { return }

    myPostViewController.updateLabel(title: title)
  }
}
