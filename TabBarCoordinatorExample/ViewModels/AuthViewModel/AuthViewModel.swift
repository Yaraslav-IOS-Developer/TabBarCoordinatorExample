//
//  AuthViewModel.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 17.07.23.
//

import Foundation


protocol AuthViewModelProtocol: AnyObject {
  func logIn()
  func logOut()
}

final class AuthViewModel: AuthViewModelProtocol {
  var authLogIn: AuthLogIn?
  var authLogOut: AuthLogOut?

  init(authLogIn: AuthLogIn?, authLogOut: AuthLogOut? ) {
    self.authLogIn = authLogIn
    self.authLogOut = authLogOut
  }

  func logIn() {
    authLogIn?.logIn()
  }

  func logOut() {
    authLogOut?.logOut()
  }
}
