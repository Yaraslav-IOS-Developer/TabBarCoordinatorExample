//
//  MoreDetailViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 26.07.23.
//

import UIKit


final class MoreDetailViewController: UIViewController {
  private var moreDetailView: MoreDetailProtocol

  init(moreDetailView: MoreDetailProtocol) {
    self.moreDetailView = moreDetailView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = moreDetailView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
