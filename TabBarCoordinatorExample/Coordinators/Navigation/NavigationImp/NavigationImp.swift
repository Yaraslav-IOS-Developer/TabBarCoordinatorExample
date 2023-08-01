//
//  NavigationImp.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 27.07.23.
//

import UIKit


final class NavigationImp: NSObject {
  var rootViewController: UINavigationController
  var dismissNavigation: (() -> Void)?

  private var completions: [UIViewController: () -> Void] = [ : ]

  init(rootViewController: UINavigationController) {
    self.rootViewController = rootViewController
    super.init()
    rootViewController.delegate = self
    rootViewController.presentationController?.delegate = self
  }
}

extension NavigationImp: NavigationProtocol {
  var viewController: [UIViewController] {
    get {
      rootViewController.viewControllers
    }
    set {
      rootViewController.viewControllers = newValue
    }
  }

  var navigationBar: UINavigationBar {
    rootViewController.navigationBar
  }

  func present(_ viewControllerToPresent: UIViewController, animate: Bool) {
    rootViewController.present(viewControllerToPresent, animated: animate)
  }

  func dismiss(animate: Bool) {
    rootViewController.dismiss(animated: animate)
  }

  func pushViewController(_ viewControllerToPresent: UIViewController, animate: Bool, completion: (() -> Void)?) {
    if let completion = completion {
      completions[viewControllerToPresent] = completion
    }
    rootViewController.pushViewController(viewControllerToPresent, animated: animate)
  }
}

extension NavigationImp: UINavigationControllerDelegate {
  func navigationController(
    _ navigationController: UINavigationController,
    didShow viewController: UIViewController,
    animated: Bool
  ) {
    guard let controller = navigationController.transitionCoordinator?.viewController(forKey: .from),
          !navigationController.viewControllers.contains(controller)
    else { return }
    guard let completion = completions[controller] else { return }
    completion()
    completions.removeValue(forKey: controller)
  }
}

extension NavigationImp: UIAdaptivePresentationControllerDelegate {
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    dismissNavigation?()
    dismissNavigation = nil
  }
}
