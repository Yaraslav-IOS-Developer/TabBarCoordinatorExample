//
//  HomeCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 25.07.23.
//

import UIKit


final class HomeCoordinator: CoordinatorProtocol {
  var navigation: UINavigationController
  private let factory: HomeFactory

  init(navigation: UINavigationController, factory: HomeFactory) {
    self.navigation = navigation
    self.factory = factory
  }

  func start() {
    let homeViewController = factory.makeHomeViewController(coordinator: self)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(homeViewController, animated: true)
    factory.makeTabBarItem(navigation: navigation)
  }
}

extension HomeCoordinator: HomeViewControllerCoordinator {
  func didSelectPost(id: Int) {
    //PostDetail
  }
}
