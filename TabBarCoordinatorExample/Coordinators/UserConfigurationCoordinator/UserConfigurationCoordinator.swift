//
//  UserConfigurationCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 27.07.23.
//

import UIKit

protocol UserConfigurationCoordinatorDelegate: AnyObject {
  func didFinish()
}

final class UserConfigurationCoordinator: CoordinatorProtocol {
  var navigation: NavigationPortocol
  private let factory: UserConfigurationFactory
  private weak var delegate: UserConfigurationCoordinatorDelegate?


  init(
    navigation: NavigationPortocol,
    factory: UserConfigurationFactory,
    delegate: UserConfigurationCoordinatorDelegate?
  ) {
    self.navigation = navigation
    self.factory = factory
    self.delegate = delegate
  }

  func start() {
    let userConfiguration = factory.makeUserConfigurationViewController(coordinator: self)
    navigation.viewController = [userConfiguration]
  }

}

extension UserConfigurationCoordinator: UserConfigurationViewControllerCoordinator {
  func didFinishFlow() {
    delegate?.didFinish()
  }

  func didSelectAvatarButton() {
    let avatarViewController = factory.makeAvatarViewController()
    navigation.pushViewController(avatarViewController, animated: true)
  }
}
