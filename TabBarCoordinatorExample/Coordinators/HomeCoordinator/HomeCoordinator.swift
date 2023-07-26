//
//  HomeCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 25.07.23.
//

import UIKit


final class HomeCoordinator: CoordinatorProtocol {
  var navigation: NavigationPortocol
  var childCoordinators: [CoordinatorProtocol] = []
  private let factory: HomeFactory

  init(navigation: NavigationPortocol, factory: HomeFactory) {
    self.navigation = navigation
    self.factory = factory
  }

  func start() {
    let homeViewController = factory.makeHomeViewController(coordinator: self)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(homeViewController, animate: true)
    factory.makeTabBarItem(navigation: navigation)
  }
}

extension HomeCoordinator: HomeViewControllerCoordinator {
  func didSelectPost(id: Int) {
   let postDetailsCoordinator = factory.makePostDetailsCoordinator(navigation: navigation, id: id, parentCoordinator: self)
    addChildCoordinator(postDetailsCoordinator)
  }
}

extension HomeCoordinator: ParentCoordinator { }
