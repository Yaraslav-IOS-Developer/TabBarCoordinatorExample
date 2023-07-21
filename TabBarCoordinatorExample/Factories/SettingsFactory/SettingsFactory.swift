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

  func makeTabBarItem(navigation: UINavigationController) {
    makeItemTabBar(
      navigation: navigation,
      title: "Setting",
      image: "gearshape.2",
      selectedImage: "gearshape.2.fill")
  }
}

