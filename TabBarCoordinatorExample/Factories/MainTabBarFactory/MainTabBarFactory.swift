//
//  MainTabBarFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit


struct MainTabBarFactory {
  let appDIContainer: AppDIContainer?

  func makeMainTabBarController() -> UITabBarController {
    let mainTabBarController = MainTabBarController()
    mainTabBarController.viewControllers = [UIViewController()]

    return mainTabBarController
  }
}
