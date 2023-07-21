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
  var navigation: UINavigationController
  private let factory: SettingsFactory
  private weak var delegate: SettingsCoordinatorDelegate?

  init(
    navigation: UINavigationController,
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
        break
      case .account:
        break
      case .theme:
        break
      case .logOut:
        delegate?.didTapLogOut()
      case .noNavigation:
        break
    }
  }
}

