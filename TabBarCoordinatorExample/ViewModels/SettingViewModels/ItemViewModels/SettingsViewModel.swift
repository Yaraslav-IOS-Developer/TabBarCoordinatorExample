//
//  SettingsViewModel.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import Foundation

final class SettingsViewModel {
  private var itemSettingsViewModel: [ItemSettingsViewModel] = [
    ItemSettingsViewModel(
      title: "User Configuration",
      icon: "person",
      isNavigation: false,
      navigation: .userConfiguration),
    ItemSettingsViewModel(
      title: "Account",
      icon: "archivebox.circle",
      isNavigation: true,
      navigation: .account),
    ItemSettingsViewModel(
      title: "Theme",
      icon: "paintbrush",
      isNavigation: true,
      navigation: .theme),
    ItemSettingsViewModel(
      title: "LogOut",
      icon: "door.right.hand.open",
      isNavigation: false,
      navigation: .logOut),
    ItemSettingsViewModel(
      title: "Version App 1.0.1",
      icon: "apps.iphone",
      isNavigation: false,
      navigation: .noNavigation)
  ]

  var settingCount: Int {
    return itemSettingsViewModel.count
  }

  private let  auth: AuthLogOut?
  
  init(auth: AuthLogOut?) {
    self.auth = auth
  }

  private func logOut() {
    auth?.logOut()
  }

  func getItemSettingViewModel(row: Int) -> ItemSettingsViewModel {
    return itemSettingsViewModel[row]
  }

  func cellSelected(row: Int)  -> SettingsNavigation {
    let navigation = itemSettingsViewModel[row].navigation
    if navigation == .logOut {
      logOut()
    }
    return navigation
  }
}
