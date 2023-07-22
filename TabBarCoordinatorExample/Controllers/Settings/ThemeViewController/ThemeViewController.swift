//
//  ThemeViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 21.07.23.
//

import UIKit

final class ThemeViewController: UIViewController {
  private var containerView: ThemeView! {
    return view as? ThemeView
  }

  override func loadView() {
    view = ThemeView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}
