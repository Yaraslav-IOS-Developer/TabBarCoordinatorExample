//
//  AuthCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 17.07.23.
//

import UIKit


protocol AuthCoordinatorDelegate: AnyObject {
  func didFinishLogin()
}

final class AuthCoordinator: CoordinatorProtocol {
  var navigation: NavigationPortocol
  
  private let factory: AuthFactory

  weak var delegate: AuthCoordinatorDelegate?

  init(navigation: NavigationPortocol, factory: AuthFactory, delegate: AuthCoordinatorDelegate?) {
    self.navigation = navigation
    self.factory = factory
    self.delegate = delegate
  }

  func start() {
    let controller = factory.makeAuthViewController(coordinator: self)
    navigation.pushViewController(controller, animated: true)
  }
}

extension AuthCoordinator: AuthViewControllerCoordinator {
  func didFinish() {
    delegate?.didFinishLogin()
  }
}
