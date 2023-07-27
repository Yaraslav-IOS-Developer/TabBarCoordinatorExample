//
//  AvatarView.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 27.07.23.
//

import UIKit

protocol AvatarProtocol: AnyObject {
  var contentView: UIView! { get }
}

final class AvatarView: UIView, AvatarProtocol {
  @IBOutlet weak var contentView: UIView!

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
