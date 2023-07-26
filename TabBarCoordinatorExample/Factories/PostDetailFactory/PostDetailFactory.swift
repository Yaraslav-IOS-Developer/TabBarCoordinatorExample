//
//  PostDetailFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 25.07.23.
//

import UIKit

struct PostDetailFactory {
  private(set) var id: Int

  func makePostDetailViewController(delegate: PostDetailDelegate?, coordinator: PostDetailViewControllerCoordinator? ) -> UIViewController {
    let view = PostDetailView(delegate: delegate)
    let postDetailViewController = PostDetailViewController(postDetailView: view, coordinator: coordinator)
    postDetailViewController.title = "Post -\(id)"
    postDetailViewController.tabBarController?.tabBar.isHidden = true
    return postDetailViewController
  }

  func makePostDetailPhotoViewController() -> UIViewController {
    let view = PostDetailPhotosView()
    let postDetailPhotoViewController = PostDetailPhotosViewController(postDetailPhotoView: view)

    return postDetailPhotoViewController
  }

  func makeMoreDetailViewController() -> UIViewController {
    let view = MoreDetailView()
    let moreDetailViewController = MoreDetailViewController(moreDetailView: view)

    return moreDetailViewController
  }

  func makePostDetailSourceViewController() -> UIViewController {
    let view = PostDetailSourceView()
    let postDetailSourceViewController = PostDetailSourceViewController(postDetailSourceView: view)

    return postDetailSourceViewController
  }
}
