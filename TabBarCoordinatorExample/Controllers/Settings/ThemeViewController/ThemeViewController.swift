//
//  ThemeViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 21.07.23.
//

import UIKit


final class ThemeViewController: UIViewController {
  private var themeView: ThemeViewProtocol

  init(themeView: ThemeViewProtocol) {
    self.themeView = themeView
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = themeView as? UIView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
