//
//  SceneDelegate.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?
  var appCoordinator: CoordinatorProtocol?
  var appFactory: AppFactoryProtocol?
  var appDIContainer: AppDIContainerProtocol?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let scene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: scene)

    appDIContainer = AppDIContainer()
    appFactory = AppFactory(appDIContainer: appDIContainer)
    appCoordinator = AppCoordinator(
      navigation: NavigationImp(rootViewController: UINavigationController()),
      window: window,
      factory: appFactory,
      auth: appDIContainer?.auth
    )

    appCoordinator?.start()
  }
}

