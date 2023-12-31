//
//  Coordinator.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 12.07.23.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
  var navigation: NavigationPortocol { get set }
  func start()
}
