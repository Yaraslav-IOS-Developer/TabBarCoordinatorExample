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
  var navigation: NavigationProtocol
  var childCoordinators: [CoordinatorProtocol] = []

  private let factory: SettingsFactoryProtocol
  private weak var delegate: SettingsCoordinatorDelegate?

  init(
    navigation: NavigationProtocol,
    factory: SettingsFactoryProtocol,
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

extension SettingsCoordinator: ParentCoordinator { }

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
    let userConfigurationCoordinator = factory.makeUserConfigurationCoordinator(delegate: self)
    addChildCoordinator(userConfigurationCoordinator)
    let viewController = userConfigurationCoordinator.navigation.rootViewController
    navigation.present(viewController, animate: true)

    // Это замыкание срабатывает когда мы закрываем  экран свайпом вниз(экран был открыть не на весь экран), если экран был открыт на весь срабатывает метод делегата   UserConfigurationCoordinatorDelegate. Здесь это приведено для примера в реальном проекте нужно использовать одну из функций в зависимости как был представлен контроллер на весь экран или нет.
    userConfigurationCoordinator.navigation.dismissNavigation = { [weak self] in
      guard let sSelf = self else { return }
      sSelf.removeChildCoordinators(userConfigurationCoordinator)
    }
  }
}

extension SettingsCoordinator: UserConfigurationCoordinatorDelegate {
  func didFinish(childCoordinator: CoordinatorProtocol) {
    childCoordinator.navigation.dismissNavigation = nil
    removeChildCoordinators(childCoordinator)
    navigation.dismiss(animate: true)
  }
}

