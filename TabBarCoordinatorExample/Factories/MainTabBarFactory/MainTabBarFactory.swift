//
//  MainTabBarFactory.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit


struct MainTabBarFactory {
  let appDIContainer: AppDIContainer?

  func makeMainTabBarController() -> MainTabBarController {
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
    let navigation = UINavigationController()
    let coordinator = HomeCoordinator(navigation: navigation, factory: factory)

    return coordinator
  }

  private func makeCommunitiesCoordinator() -> CoordinatorProtocol {
    let factory = CommunitiesFactoryImp(appDIContainer: appDIContainer)
    let navigation = UINavigationController()
    let coordinator = CommunitiesCoordinator(navigation: navigation, factory: factory)

    return coordinator
  }

  private func makePostCoordinator() -> CoordinatorProtocol {
    let factory = MyPostsFactoryImp()
    let navigation = UINavigationController()
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
    let navigation = UINavigationController()
    let coordinator = SettingsCoordinator(navigation: navigation, factory: factory, delegate: delegate)

    return coordinator
  }
}
