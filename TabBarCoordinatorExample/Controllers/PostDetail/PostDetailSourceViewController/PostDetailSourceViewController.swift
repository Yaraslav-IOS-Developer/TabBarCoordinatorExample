//
//  PostDetailSourceViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 26.07.23.
//

import UIKit


final class PostDetailSourceViewController: UIViewController {
  private var postDetailSourceView: PostDetailSourceProtocol

  init(postDetailSourceView: PostDetailSourceProtocol) {
    self.postDetailSourceView = postDetailSourceView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = postDetailSourceView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
