//
//  CommunitiesViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 21.07.23.
//

import UIKit

final class CommunitiesViewController: UIViewController {
  private var containerView: CommunitiesView! {
    return view as? CommunitiesView
  }

  override func loadView() {
    view = CommunitiesView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
