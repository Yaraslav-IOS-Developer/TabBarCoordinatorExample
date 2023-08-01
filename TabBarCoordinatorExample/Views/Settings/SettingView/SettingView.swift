//
//  SettingView.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit


protocol SettingViewProtocol: AnyObject {
  var contentView: UIView! { get }
  var tableView: UITableView! { get }
}

final class SettingView: UIView, SettingViewProtocol {
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var tableView: UITableView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }

  private func commonInit() {
    Bundle.main.loadNibNamed("\(type(of: self))", owner: self, options: nil)

    addSubview(contentView)

    contentView.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: topAnchor),
      contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
      contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
