//
//  AppCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit


final class AppCoordinator: CoordinatorProtocol {
  var navigation: NavigationProtocol
  var childCoordinators: [CoordinatorProtocol] = []
  private var window: UIWindow?
  private var factory: AppFactoryProtocol?
  private var auth: SessionCheckerAuth?

  init(navigation: NavigationProtocol, window: UIWindow, factory: AppFactoryProtocol?, auth: Auth?) {
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
    let authCoordinator = factory?.makeAuthCoordinator(navigation: navigation, delegate: self)
    addChildCoordinator(authCoordinator)
  }

  private func startMainTabBarCoordinator() {
    let mainTabBarCoordinator = factory?.makeMainTabBarCoordinator(navigation: navigation, delegate: self)
    addChildCoordinator(mainTabBarCoordinator)
  }

  private func clearCurrentCoordinatorAndStartNextCoordinator() {
    navigation.rootViewController.viewControllers = []
    clearAllChildsCoordinator()
    startSomeCoordinator()
  }
}

extension AppCoordinator: AuthCoordinatorDelegate {
  func didFinishLogin() {
    clearCurrentCoordinatorAndStartNextCoordinator()
  }
}

extension AppCoordinator: MainTabBarCoordinatorDelegate {
  func didFinish() {
    clearCurrentCoordinatorAndStartNextCoordinator()
  }
}

extension AppCoordinator: ParentCoordinator { }
