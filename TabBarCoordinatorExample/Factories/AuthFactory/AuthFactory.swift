//
//  AuthFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 17.07.23.
//

import UIKit


protocol AuthFactoryProtocol {
  var appDIContainer: AppDIContainerProtocol? { get }
  func makeAuthViewController(coordinator: AuthViewControllerCoordinator?) -> UIViewController
}

struct AuthFactory: AuthFactoryProtocol {
  let appDIContainer: AppDIContainerProtocol?

  func makeAuthViewController(coordinator: AuthViewControllerCoordinator?) -> UIViewController {
    let view = AuthView()
    let authViewController = AuthViewController(
      authView: view, coordinator: coordinator,
      viewModel: AuthViewModel(authLogIn: appDIContainer?.auth,
                               authLogOut: appDIContainer?.auth))

    return authViewController
  }
}
