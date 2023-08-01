//
//  AuthViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 17.07.23.
//

import UIKit


protocol AuthViewControllerCoordinator: AnyObject {
  func didFinish()
}

final class AuthViewController: UIViewController {
  private var authView: AuthViewProtocol
  private weak var coordinator: AuthViewControllerCoordinator?
  private let viewModel: AuthViewModelProtocol?

  init(
    authView: AuthViewProtocol,
    coordinator: AuthViewControllerCoordinator?,
    viewModel: AuthViewModelProtocol?
  ) {
    self.authView = authView
    self.coordinator = coordinator
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = authView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupButtons()
  }

  private func setupButtons() {
    authView.onLoginButton = { [weak self] in
      guard let sSelf = self else { return }
      sSelf.viewModel?.logIn()
      sSelf.coordinator?.didFinish()
    }
  }
}
