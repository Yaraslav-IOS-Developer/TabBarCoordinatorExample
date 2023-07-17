//
//  AppCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit


final class AppCoordinator: CoordinatorProtocol {
  var navigation: UINavigationController

  var window: UIWindow?
  var factory: AppFactory?
  var auth: Auth?

  init(navigation: UINavigationController, window: UIWindow, factory: AppFactory?, auth: Auth?) {
    self.navigation = navigation
    self.window = window
    self.factory = factory
    self.auth = auth
  }

  func start() {
    print("Here")
  }
}
