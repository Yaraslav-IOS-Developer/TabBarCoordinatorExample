//
//  CommunitiesViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 21.07.23.
//

import UIKit


final class CommunitiesViewController: UIViewController {
  private var communitiesView: CommunitiesViewProtocol

  init(communitiesView: CommunitiesViewProtocol) {
    self.communitiesView = communitiesView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = communitiesView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
