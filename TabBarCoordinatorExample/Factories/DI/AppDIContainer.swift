//
//  AppDIContainer.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 17.07.23.
//

import Foundation


protocol AppDIContainerProtocol {
  var auth: Auth { get }
}

struct AppDIContainer: AppDIContainerProtocol {
  var auth = Auth()
}
