//
//  NavigationPortocol.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 26.07.23.
//

import UIKit


protocol NavigationProtocol: AnyObject {
  var rootViewController: UINavigationController { get }
  var viewController: [UIViewController] { get set }
  var navigationBar: UINavigationBar { get }

  func present(_ viewControllerToPresent: UIViewController, animate: Bool)
  func pushViewController(_ viewControllerToPresent: UIViewController, animate: Bool, completion: (() -> Void)?)
  func dismiss(animate: Bool)
  var dismissNavigation: (() -> Void)? { get set }
}

extension NavigationProtocol {
  func pushViewController(_ viewControllerToPresent: UIViewController, animated: Bool) {
   pushViewController(viewControllerToPresent, animate: animated, completion: nil)
  }
}

