//
//  MainTabBarCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit

final class MainTabBarCoordinator: CoordinatorProtocol {
  var navigation: UINavigationController
  private let factory: MainTabBarFactory

  init(navigation: UINavigationController, factory: MainTabBarFactory) {
    self.navigation = navigation
    self.factory = factory
  }

  func start() {
    let navigationTabBar = factory.makeMainTabBarController()
    navigation.pushViewController(navigationTabBar, animated: false)
  }
}
