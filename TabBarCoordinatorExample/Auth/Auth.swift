//
//  Auth.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 17.07.23.
//

import UIKit

protocol SessionCheckerAuth {
  var isSessionActive: Bool { get }
}

protocol AuthLogIn {
  func logIn()
}

protocol AuthLogOut {
  func logOut()
}

final class Auth {
  private var session = false
}

extension Auth: SessionCheckerAuth{
  var isSessionActive: Bool {
    return session
  }
}

extension Auth: AuthLogIn{
  func logIn() {
    session = true
  }
}

extension Auth: AuthLogOut {
  func logOut() {
    session = false
  }
}
