//
//  SettingsCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit

protocol SettingsCoordinatorDelegate: AnyObject {
  func didTapLogOut()
}

final class SettingsCoordinator: CoordinatorProtocol {
  var navigation: NavigationPortocol
  private let factory: SettingsFactory

   var userConfigurationCoordinator: CoordinatorProtocol?
  private weak var delegate: SettingsCoordinatorDelegate?

  init(
    navigation: NavigationPortocol,
    factory: SettingsFactory,
    delegate: SettingsCoordinatorDelegate?
  ) {
    self.navigation = navigation
    self.factory = factory
    self.delegate = delegate
  }

  func start() {
    let controller = factory.makeSettingsViewController(settingViewControllerDelegate: self)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(controller, animated: true)
    factory.makeTabBarItem(navigation: navigation)
  }
}

extension SettingsCoordinator: SettingViewControllerDelegate {
  func didSelectCell(settingsNavigation: SettingsNavigation) {
    switch settingsNavigation {
      case .userConfiguration:
        callUserConfigurationCoordinator()

      case .account:
        navigation.pushViewController(factory.makeAccountViewController(), animated: true)

      case .theme:
        navigation.pushViewController(factory.makeThemeViewController(), animated: true)

      case .logOut:
        delegate?.didTapLogOut()
        
      case .noNavigation:
        break
    }
  }

  private func callUserConfigurationCoordinator() {
    userConfigurationCoordinator = factory.makeUserConfigurationCoordinator(delegate: self)
    guard let userConfigurationCoordinator = userConfigurationCoordinator else { return }
    userConfigurationCoordinator.start()
    let viewController = userConfigurationCoordinator.navigation.rootViewController
    navigation.present(viewController, animate: true)
  }
}

extension SettingsCoordinator: UserConfigurationCoordinatorDelegate {
  func didFinish() {
    userConfigurationCoordinator = nil
    navigation.dismiss(animate: true)
  }
}

