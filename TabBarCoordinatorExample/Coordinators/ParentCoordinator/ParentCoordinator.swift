//
//  ParentCoordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 26.07.23.
//

protocol ParentCoordinator: AnyObject {
  var childCoordinators: [CoordinatorProtocol] { get set }
}

extension ParentCoordinator {
  func addChildCoordinator(_ childCoordinator: CoordinatorProtocol?) {
    guard let childCoordinator = childCoordinator else { return }
    childCoordinators.append(childCoordinator)
    childCoordinator.start()
  }

  func removeChildCoordinators(_ childCoordinator: CoordinatorProtocol) {
    childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
  }

  func clearAllChildsCoordinator() {
    childCoordinators = []
  }
}
