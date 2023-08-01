//
//  AccountViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 21.07.23.
//

import UIKit


final class AccountViewController: UIViewController {
  private var accountView: AccountViewProtocol

  init(accountView: AccountViewProtocol) {
    self.accountView = accountView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = accountView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
