//
//  CommunitiesFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 21.07.23.
//

import UIKit

protocol CommunitiesFactory {
  func makeCommunitiesViewController() -> UIViewController
  func makeTabBarItem(navigation: UINavigationController)
}

struct CommunitiesFactoryImp: CommunitiesFactory {
  let appDIContainer: AppDIContainer?

  func makeCommunitiesViewController() -> UIViewController {
    let communitiesViewController = CommunitiesViewController()
    communitiesViewController.navigationItem.title = "Communities"

    return communitiesViewController
  }

  func makeTabBarItem(navigation: UINavigationController) {
    makeItemTabBar(
      navigation: navigation,
      title: "Communities",
      image: "person.3",
      selectedImage: "person.3.fill")
  }
}

extension CommunitiesFactoryImp: ItemTabBarFactory { }
