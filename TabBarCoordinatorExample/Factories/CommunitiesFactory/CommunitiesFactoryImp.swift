//
//  CommunitiesFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 21.07.23.
//

import UIKit


protocol CommunitiesFactoryProtocol {
  func makeCommunitiesViewController() -> UIViewController
  func makeTabBarItem(navigation: NavigationProtocol)
}

struct CommunitiesFactoryImp: CommunitiesFactoryProtocol {
  func makeCommunitiesViewController() -> UIViewController {
    let view = CommunitiesView()
    let communitiesViewController = CommunitiesViewController(communitiesView: view)
    communitiesViewController.navigationItem.title = "Communities"

    return communitiesViewController
  }

  func makeTabBarItem(navigation: NavigationProtocol) {
    makeItemTabBar(
      navigation: navigation,
      title: "Communities",
      image: "person.3",
      selectedImage: "person.3.fill")
  }
}

extension CommunitiesFactoryImp: ItemTabBarFactory { }
