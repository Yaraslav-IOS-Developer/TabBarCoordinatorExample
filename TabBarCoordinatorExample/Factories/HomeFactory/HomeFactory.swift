//
//  HomeFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 25.07.23.
//

import UIKit


protocol HomeFactoryProtocol {
  func makeTabBarItem(navigation: NavigationProtocol)
  func makeHomeViewController(coordinator: HomeViewControllerCoordinator?) -> UIViewController
  func makePostDetailsCoordinator(navigation: NavigationProtocol, id: Int, parentCoordinator: ParentCoordinator?) -> CoordinatorProtocol
}

struct HomeFactoryImp: HomeFactoryProtocol {
  func makeHomeViewController(coordinator: HomeViewControllerCoordinator?) -> UIViewController {
    let homeView = HomeView()
    let layout = UICollectionViewFlowLayout()
    let homeViewController = HomeViewController(homeView: homeView, collectionViewLayout: layout, coordinator: coordinator)
    homeViewController.title = "Home"

    return homeViewController
  }

  func makeTabBarItem(navigation: NavigationProtocol) {
    makeItemTabBar(
      navigation: navigation,
      title: "Home",
      image: "house",
      selectedImage: "house.fill")
  }

  func makePostDetailsCoordinator(
    navigation: NavigationProtocol,
    id: Int,
    parentCoordinator: ParentCoordinator?
  ) -> CoordinatorProtocol {
    let factory = PostDetailFactory(id: id)
    let coordinator = PostDetailCoordinator(
      navigation: navigation,
      factory: factory,
      parentCoordinator: parentCoordinator
    )

    return coordinator
  }
}

extension HomeFactoryImp: ItemTabBarFactory { }
