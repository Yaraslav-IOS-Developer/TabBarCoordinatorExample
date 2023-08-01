//
//  NewPostViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit


protocol NewPostViewControllerCoordinator: AnyObject {
  func didSaveNewPost(title: String)
}

final class NewPostViewController: UIViewController {
  private var newPostView: NewPostViewProtocol
  private weak var coordinator: NewPostViewControllerCoordinator?
  
  init(newPostView: NewPostViewProtocol, coordinator: NewPostViewControllerCoordinator?) {
    self.newPostView = newPostView
    self.coordinator = coordinator
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func loadView() {
    view = newPostView as? UIView
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
  }
  
  private func setupUI() {
    setupButtons()
    newPostView.contentView.backgroundColor = .red
  }
  
  private func setupButtons() {
    newPostView.onSaveButton = { [weak self] in
      guard let sSelf = self else { return }
      sSelf.coordinator?.didSaveNewPost(title: sSelf.randomPost())
    }
  }

  private func randomPost() -> String {
    "Post #\(Int.random(in: 0...999))"
  }
}
