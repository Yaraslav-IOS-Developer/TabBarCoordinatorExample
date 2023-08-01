//
//  MainTabBarFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit


protocol MainTabBarFactoryProtocol {
  var appDIContainer: AppDIContainerProtocol? { get }

  func makeMainTabBarController() -> UITabBarController
  func makeChildCoordinators(delegate: SettingsCoordinatorDelegate?) -> [CoordinatorProtocol]
}

struct MainTabBarFactory: MainTabBarFactoryProtocol {
  let appDIContainer: AppDIContainerProtocol?

  func makeMainTabBarController() -> UITabBarController {
    let mainTabBarController = MainTabBarController()
    return mainTabBarController
  }

  func makeChildCoordinators(delegate: SettingsCoordinatorDelegate?) -> [CoordinatorProtocol] {
    let homeCoordinator = makeHomeCoordinator()
    let communitiesCoordinator = makeCommunitiesCoordinator()
    let postCoordinator = makePostCoordinator()
    let settingsCoordinator = makeSettingsCoordinator(delegate: delegate)
    
    return [
      homeCoordinator,
      communitiesCoordinator,
      postCoordinator,
      settingsCoordinator
    ]
  }

  private func makeHomeCoordinator() -> CoordinatorProtocol {
    let factory = HomeFactoryImp()
    let navigation = NavigationImp(rootViewController: UINavigationController())
    let coordinator = HomeCoordinator(navigation: navigation, factory: factory)

    return coordinator
  }

  private func makeCommunitiesCoordinator() -> CoordinatorProtocol {
    let factory = CommunitiesFactoryImp()
    let navigation = NavigationImp(rootViewController: UINavigationController())
    let coordinator = CommunitiesCoordinator(navigation: navigation, factory: factory)

    return coordinator
  }

  private func makePostCoordinator() -> CoordinatorProtocol {
    let factory = MyPostsFactoryImp()
    let navigation = NavigationImp(rootViewController: UINavigationController())
    let mediator = MyPostsMediatorImp()
    let newPostView = NewPostView()
    let myPostView = MyPostsView()
    let coordinator = PostCoordinator(
      navigation: navigation,
      newPostView: newPostView,
      myPostView: myPostView,
      factory: factory,
      myPostsMediator: mediator
    )
    
    return coordinator
  }

  private func makeSettingsCoordinator(delegate: SettingsCoordinatorDelegate?) -> CoordinatorProtocol {
    let factory = SettingsFactory(appDIContainer: appDIContainer)
    let navigation = NavigationImp(rootViewController: UINavigationController())
    let coordinator = SettingsCoordinator(navigation: navigation, factory: factory, delegate: delegate)

    return coordinator
  }
}
