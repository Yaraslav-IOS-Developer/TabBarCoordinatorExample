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
  private var settingsCoordinator: CoordinatorProtocol?
  var navigation: UINavigationController
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
    
    settingsCoordinator = factory.makeSettingsCoordinate(delegate: self)
    guard let settingsCoordinator = settingsCoordinator else { return }
    navigationTabBar.viewControllers = [settingsCoordinator.navigation]
    settingsCoordinator.start()
  }
}

extension MainTabBarCoordinator: SettingsCoordinatorDelegate {
  func didTapLogOut() {
    delegate?.didFinish()
  }
}
