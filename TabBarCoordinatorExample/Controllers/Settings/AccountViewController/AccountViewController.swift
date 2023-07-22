//
//  AccountViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 21.07.23.
//

import UIKit

final class AccountViewController: UIViewController {
  private var containerView: AccountView! {
    return view as? AccountView
  }

  override func loadView() {
    view = AccountView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
