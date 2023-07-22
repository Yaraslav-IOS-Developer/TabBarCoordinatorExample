//
//  CommunitiesCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 21.07.23.
//

import UIKit

final class CommunitiesCoordinator: CoordinatorProtocol {
  var navigation: UINavigationController
  private let factory: CommunitiesFactory

  init(navigation: UINavigationController, factory: CommunitiesFactory) {
    self.navigation = navigation
    self.factory = factory
  }

  func start() {
    let communitiesViewController = factory.makeCommunitiesViewController()
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(communitiesViewController, animated: true)

    factory.makeTabBarItem(navigation: navigation)
  }
}
