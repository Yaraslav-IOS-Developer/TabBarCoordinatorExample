//
//  UserConfigurationFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 27.07.23.
//

import UIKit


protocol UserConfigurationFactoryProtocol {
  func makeUserConfigurationViewController(coordinator: UserConfigurationViewControllerCoordinator?) -> UIViewController
  func makeAvatarViewController() -> UIViewController
}

struct UserConfigurationFactory: UserConfigurationFactoryProtocol {
  func makeUserConfigurationViewController(coordinator: UserConfigurationViewControllerCoordinator?) -> UIViewController {
    let userConfigurationView = UserConfigurationView()
    let userConfigurationViewController = UserConfigurationViewController(userConfigurationView: userConfigurationView, coordinator: coordinator)
    userConfigurationViewController.title = "User Configuration"

    return userConfigurationViewController
  }

  func makeAvatarViewController() -> UIViewController {
    let avatarView = AvatarView()
    let avatarViewController = AvatarViewController(avatarView: avatarView)
    avatarViewController.title = "Make your avatar"

    return avatarViewController
  }
}
