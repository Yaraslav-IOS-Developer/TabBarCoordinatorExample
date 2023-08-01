//
//  AppFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 17.07.23.
//

import UIKit


protocol AppFactoryProtocol {
  var appDIContainer: AppDIContainerProtocol? { get }
  func makeAuthCoordinator(navigation: NavigationProtocol, delegate: AuthCoordinatorDelegate?) -> CoordinatorProtocol
  func makeMainTabBarCoordinator(navigation: NavigationProtocol, delegate: MainTabBarCoordinatorDelegate?) -> CoordinatorProtocol
}

struct AppFactory: AppFactoryProtocol {
  var appDIContainer: AppDIContainerProtocol?

  func makeAuthCoordinator(navigation: NavigationProtocol, delegate: AuthCoordinatorDelegate?) -> CoordinatorProtocol {
    let factoryLogIn = AuthFactory(appDIContainer: appDIContainer)
    let coordinator = AuthCoordinator(navigation: navigation, factory: factoryLogIn, delegate: delegate)

    return coordinator
  }

  func makeMainTabBarCoordinator(navigation: NavigationProtocol, delegate: MainTabBarCoordinatorDelegate?) -> CoordinatorProtocol {
    let factoryMainTabBar = MainTabBarFactory(appDIContainer: appDIContainer)
    let coordinator = MainTabBarCoordinator(navigation: navigation, factory: factoryMainTabBar, delegate: delegate)

    return coordinator
  }
}
