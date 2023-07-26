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
    navigation.pushViewController(controller, animate: true)
    factory.makeTabBarItem(navigation: navigation)
  }
}

extension SettingsCoordinator: SettingViewControllerDelegate {
  func didSelectCell(settingsNavigation: SettingsNavigation) {
    switch settingsNavigation {
      case .userConfiguration:
        break

      case .account:
        navigation.pushViewController(factory.makeAccountViewController(), animate: true)

      case .theme:
        navigation.pushViewController(factory.makeThemeViewController(), animate: true)

      case .logOut:
        delegate?.didTapLogOut()
        
      case .noNavigation:
        break
    }
  }
}

