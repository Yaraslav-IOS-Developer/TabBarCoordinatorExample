//
//  SettingsFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit


struct SettingsFactory: ItemTabBarFactory {
  let appDIContainer: AppDIContainer?

  func makeSettingsViewController(settingViewControllerDelegate: SettingViewControllerDelegate?) -> SettingViewController {
    let viewModel = SettingsViewModel(auth: appDIContainer?.auth)
    let controller = SettingViewController(viewModel: viewModel, settingViewControllerDelegate: settingViewControllerDelegate)
    controller.title = "Settings"
    return controller
  }

  func makeTabBarItem(navigation: NavigationPortocol) {
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
    let accountViewController = AccountViewController()
    accountViewController.title = "Account"
    return accountViewController
  }

  func makeThemeViewController() -> UIViewController {
    let themeViewController = ThemeViewController()
    themeViewController.title = "Theme"
    return themeViewController
  }
}

