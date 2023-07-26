//
//  AppFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 17.07.23.
//

import UIKit

struct AppFactory {
  var appDIContainer: AppDIContainer?


  func makeAuthCoordinator(navigation: NavigationPortocol, delegate: AuthCoordinatorDelegate?) -> CoordinatorProtocol {
    let factoryLogIn = AuthFactory(appDIContainer: appDIContainer)
    let coordinator = AuthCoordinator(navigation: navigation, factory: factoryLogIn, delegate: delegate)

    return coordinator
  }

  func makeMainTabBarCoordinator(navigation: NavigationPortocol, delegate: MainTabBarCoordinatorDelegate?) -> CoordinatorProtocol {
    let factoryMainTabBar = MainTabBarFactory(appDIContainer: appDIContainer)
    let coordinator = MainTabBarCoordinator(navigation: navigation, factory: factoryMainTabBar, delegate: delegate)

    return coordinator
  }
}
