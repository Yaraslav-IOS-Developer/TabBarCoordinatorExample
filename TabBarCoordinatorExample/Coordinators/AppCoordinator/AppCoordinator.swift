//
//  AppCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit


final class AppCoordinator: CoordinatorProtocol {
  private var authCoordinator: CoordinatorProtocol?
  private var mainTabBarCoordinator: CoordinatorProtocol?

  private var factory: AppFactory?
  private var auth: SessionCheckerAuth?

  var navigation: NavigationPortocol
  var window: UIWindow?

  init(navigation: NavigationPortocol, window: UIWindow, factory: AppFactory?, auth: Auth?) {
    self.navigation = navigation
    self.window = window
    self.factory = factory
    self.auth = auth
  }

  func start() {
    configureWindow()
    startSomeCoordinator()
  }

  private func configureWindow() {
    window?.rootViewController = navigation.rootViewController
    window?.makeKeyAndVisible()
  }

  private func startSomeCoordinator() {
    guard let auth = auth else { return }
    if auth.isSessionActive {
      startMainTabBarCoordinator()
    } else {
      startAuthCoordinator()
    }
  }

  private func startAuthCoordinator() {
    authCoordinator = factory?.makeAuthCoordinator(navigation: navigation, delegate: self)
    authCoordinator?.start()
  }

  private func startMainTabBarCoordinator() {
    mainTabBarCoordinator = factory?.makeMainTabBarCoordinator(navigation: navigation, delegate: self)
    mainTabBarCoordinator?.start()
  }
}

extension AppCoordinator: AuthCoordinatorDelegate {
  func didFinishLogin() {
    navigation.rootViewController.viewControllers = []
    authCoordinator = nil
    startSomeCoordinator()
  }
}

extension AppCoordinator: MainTabBarCoordinatorDelegate {
  func didFinish() {
    navigation.rootViewController.viewControllers = []
    mainTabBarCoordinator = nil
    startSomeCoordinator()
  }
}
