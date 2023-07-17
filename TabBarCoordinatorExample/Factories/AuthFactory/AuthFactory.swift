//
//  AuthFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 17.07.23.
//

import Foundation

struct AuthFactory {
  let appDIContainer: AppDIContainer?

  func makeAuthViewController(coordinator: AuthViewControllerCoordinator?) -> AuthViewController {
    let authViewController = AuthViewController(
      coordinator: coordinator,
      viewModel: AuthViewModel(authLogIn: appDIContainer?.auth,
                               authLogOut: appDIContainer?.auth))

    return authViewController
  }
}
