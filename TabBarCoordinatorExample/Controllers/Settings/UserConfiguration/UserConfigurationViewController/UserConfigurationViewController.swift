//
//  UserConfigurationViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 27.07.23.
//

import UIKit


protocol UserConfigurationViewControllerCoordinator: AnyObject {
  func didSelectAvatarButton()
  func didFinishFlow()
}

final class UserConfigurationViewController: UIViewController {
  private var userConfigurationView: UserConfigurationProtocol

  private weak var coordinator: UserConfigurationViewControllerCoordinator?

  init(userConfigurationView: UserConfigurationProtocol, coordinator: UserConfigurationViewControllerCoordinator?) {
    self.userConfigurationView = userConfigurationView
    self.coordinator = coordinator
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = userConfigurationView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupBarButtonItem()
  }

  private func setupBarButtonItem() {
    let avatarButton = UIBarButtonItem(
      image: UIImage(systemName: "person"),
      primaryAction: avatarAction()
      )

    let closeButton = UIBarButtonItem(
      systemItem: .close,
      primaryAction: closeAction()
    )

    navigationItem.leftBarButtonItem = closeButton
    navigationItem.rightBarButtonItem = avatarButton
  }

  private func closeAction() -> UIAction {
    return UIAction { [weak self] _ in
      guard let sSelf = self else { return }
      sSelf.coordinator?.didFinishFlow()
    }
  }

  private func avatarAction() -> UIAction {
    return UIAction { [weak self] _ in
      guard let sSelf = self else { return }
      sSelf.coordinator?.didSelectAvatarButton()
    }
  }
}
