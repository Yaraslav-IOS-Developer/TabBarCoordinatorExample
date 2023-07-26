//
//  PostDetailPhotosViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 26.07.23.
//

import UIKit

final class PostDetailPhotosViewController: UIViewController {
  private var postDetailPhotoView: PostDetailPhotosProtocol

  init(postDetailPhotoView: PostDetailPhotosProtocol) {
    self.postDetailPhotoView = postDetailPhotoView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = postDetailPhotoView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
