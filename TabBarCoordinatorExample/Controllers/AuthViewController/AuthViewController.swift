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
  private var contentView: AuthView! {
    return view as? AuthView
  }

  private weak var coordinator: AuthViewControllerCoordinator?
  private let viewModel: AuthViewModel?

  init(coordinator: AuthViewControllerCoordinator?, viewModel: AuthViewModel?) {
    self.coordinator = coordinator
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = AuthView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupButtons()
  }

  private func setupButtons() {
    contentView.onLoginButton = { [weak self] in
      guard let sSelf = self else { return }
      sSelf.viewModel?.logIn()
      sSelf.coordinator?.didFinish()
    }
  }
}
