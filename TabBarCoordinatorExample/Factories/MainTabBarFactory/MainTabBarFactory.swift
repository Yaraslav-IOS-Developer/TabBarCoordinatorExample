//
//  MainTabBarFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit


struct MainTabBarFactory {
  let appDIContainer: AppDIContainer?

  func makeMainTabBarController() -> MainTabBarController {
    let mainTabBarController = MainTabBarController()
    return mainTabBarController
  }

  func makeChildCoordinators(delegate: SettingsCoordinatorDelegate?) -> [CoordinatorProtocol] {
    let communitiesCoordinate = makeCommunitiesCoordinate()
    let settingsCoordinate = makeSettingsCoordinate(delegate: delegate)
    return [communitiesCoordinate,settingsCoordinate]
  }

  private func makeCommunitiesCoordinate() -> CoordinatorProtocol {
    let factory = CommunitiesFactoryImp(appDIContainer: appDIContainer)
    let navigation = UINavigationController()
    let coordinate = CommunitiesCoordinator(navigation: navigation, factory: factory)

    return coordinate
  }

  private func makeSettingsCoordinate(delegate: SettingsCoordinatorDelegate?) -> CoordinatorProtocol {
    let factory = SettingsFactory(appDIContainer: appDIContainer)
    let navigation = UINavigationController()
    let coordinate = SettingsCoordinator(navigation: navigation, factory: factory, delegate: delegate)

    return coordinate
  }
}
