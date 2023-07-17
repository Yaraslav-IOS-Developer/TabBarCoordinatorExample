//
//  AppCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit


final class AppCoordinator: CoordinatorProtocol {
  private var authCoordinator: CoordinatorProtocol?

  var navigation: UINavigationController
  var window: UIWindow?
  var factory: AppFactory?
  var auth: SessionCheckerAuth?

  init(navigation: UINavigationController, window: UIWindow, factory: AppFactory?, auth: Auth?) {
    self.navigation = navigation
    self.window = window
    self.factory = factory
    self.auth = auth
  }

  func start() {
    configureWindow()
    startAuthCoordinator()
  }

  private func startAuthCoordinator() {
    guard let auth = auth else { return }
    if auth.isSessionActive {
      print("Open tabBar")
    } else {
      authCoordinator = factory?.makeAuthCoordinator(navigation: navigation, delegate: self)
      authCoordinator?.start()
    }
  }

  private func configureWindow() {
    window?.rootViewController = navigation
    window?.makeKeyAndVisible()
  }
}

extension AppCoordinator: AuthCoordinatorDelegate {
  func didFinishLogin() {
    startAuthCoordinator()
    navigation.viewControllers = []
    authCoordinator = nil
  }
}
