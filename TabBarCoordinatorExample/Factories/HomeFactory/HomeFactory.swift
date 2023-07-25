//
//  HomeFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 25.07.23.
//

import UIKit

protocol HomeFactory {
  func makeTabBarItem(navigation: UINavigationController)
  func makeHomeViewController(coordinator: HomeViewControllerCoordinator?) -> UIViewController
}

struct HomeFactoryImp: HomeFactory {

  func makeHomeViewController(coordinator: HomeViewControllerCoordinator?) -> UIViewController {
    let homeView = HomeView()
    let layout = UICollectionViewFlowLayout()
    let homeViewController = HomeViewController(homeView: homeView, collectionViewLayout: layout, coordinator: coordinator)
    homeViewController.title = "Home"

    return homeViewController
  }

  func makeTabBarItem(navigation: UINavigationController) {
    makeItemTabBar(
      navigation: navigation,
      title: "Home",
      image: "house",
      selectedImage: "house.fill")
  }
}

extension HomeFactoryImp: ItemTabBarFactory { }
