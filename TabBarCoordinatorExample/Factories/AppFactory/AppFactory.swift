//
//  AppFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 17.07.23.
//

import UIKit

struct AppFactory {
  var appDIContainer: AppDIContainer?


  func makeAuthCoordinator(navigation: UINavigationController, delegate: AuthCoordinatorDelegate?) -> CoordinatorProtocol {
    let factoryLogIn = AuthFactory(appDIContainer: appDIContainer)
    let coordinator = AuthCoordinator(navigation: navigation, factory: factoryLogIn, delegate: delegate)

    return coordinator
  }

  func makeMainTabBarCoordinator(navigation: UINavigationController) -> CoordinatorProtocol {
    let factoryMainTabBar = MainTabBarFactory(appDIContainer: appDIContainer)
    let coordinator = MainTabBarCoordinator(navigation: navigation, factory: factoryMainTabBar)

    return coordinator
  }
}
