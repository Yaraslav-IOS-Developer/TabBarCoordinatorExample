//
//  AvatarViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 27.07.23.
//

import UIKit


final class AvatarViewController: UIViewController {
  private var avatarView: AvatarProtocol

  init(avatarView: AvatarProtocol) {
    self.avatarView = avatarView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = avatarView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
