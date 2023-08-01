//
//  SettingsFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit


protocol SettingsFactoryProtocol {
  var appDIContainer: AppDIContainerProtocol? { get }

  func makeTabBarItem(navigation: NavigationProtocol)
  func makeSettingsViewController(settingViewControllerDelegate: SettingViewControllerDelegate?) -> UIViewController
  func makeUserConfigurationCoordinator(delegate: UserConfigurationCoordinatorDelegate?) -> CoordinatorProtocol
  func makeAccountViewController() -> UIViewController
  func makeThemeViewController() -> UIViewController
}

struct SettingsFactory: SettingsFactoryProtocol {
  let appDIContainer: AppDIContainerProtocol?

  func makeSettingsViewController(settingViewControllerDelegate: SettingViewControllerDelegate?) -> UIViewController {
    let view = SettingView()
    let viewModel = SettingsViewModel(auth: appDIContainer?.auth)
    let controller = SettingViewController(settingView: view, viewModel: viewModel, settingViewControllerDelegate: settingViewControllerDelegate)
    controller.title = "Settings"
    return controller
  }
  func makeTabBarItem(navigation: NavigationProtocol) {
    makeItemTabBar(
      navigation: navigation,
      title: "Setting",
      image: "gearshape.2",
      selectedImage: "gearshape.2.fill")
  }

  func makeUserConfigurationCoordinator(delegate: UserConfigurationCoordinatorDelegate?) -> CoordinatorProtocol {
    let factory = UserConfigurationFactory()
    let navigationViewController = UINavigationController()
    navigationViewController.modalPresentationStyle = .fullScreen
    let navigation = NavigationImp(rootViewController: navigationViewController)
    let coordinator = UserConfigurationCoordinator(navigation: navigation, factory: factory, delegate: delegate)

    return coordinator
  }

  func makeAccountViewController() -> UIViewController {
    let view = AccountView()
    let accountViewController = AccountViewController(accountView: view)
    accountViewController.title = "Account"
    return accountViewController
  }

  func makeThemeViewController() -> UIViewController {
    let view = ThemeView()
    let themeViewController = ThemeViewController(themeView: view)
    themeViewController.title = "Theme"
    return themeViewController
  }
}

extension SettingsFactory: ItemTabBarFactory { }
