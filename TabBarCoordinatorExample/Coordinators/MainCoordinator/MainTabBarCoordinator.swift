//
//  MainTabBarCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit

protocol MainTabBarCoordinatorDelegate: AnyObject {
  func didFinish()
}

final class MainTabBarCoordinator: CoordinatorProtocol {
  var navigation: UINavigationController
  var childCoordinators: [CoordinatorProtocol] = []
  private var settingsCoordinator: CoordinatorProtocol?
  private let factory: MainTabBarFactory

  private weak var delegate: MainTabBarCoordinatorDelegate?

  init(
    navigation: UINavigationController,
    factory: MainTabBarFactory,
    delegate: MainTabBarCoordinatorDelegate?
  ) {
    self.navigation = navigation
    self.factory = factory
    self.delegate = delegate
  }

  func start() {
    let navigationTabBar = factory.makeMainTabBarController()
    navigation.pushViewController(navigationTabBar, animated: false)
    navigation.navigationBar.isHidden = true

    childCoordinators = factory.makeChildCoordinators(delegate: self)
    let childNavigation = childCoordinators.map { $0.navigation }
    childCoordinators.forEach { $0.start() }
    navigationTabBar.viewControllers = childNavigation
  }
}

extension MainTabBarCoordinator: SettingsCoordinatorDelegate {
  func didTapLogOut() {
    childCoordinators = []
    delegate?.didFinish()
  }
}
