//
//  MyPostsView.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit


protocol MyPostsViewProtocol: AnyObject {
  var contentView: UIView! { get }
  var collectionView: UICollectionView! { get }
  var exampleLabel: UILabel! { get }

  func updateLabel(title: String)
}

final class MyPostsView: UIView {
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var exampleLabel: UILabel!
  
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

extension MyPostsView: MyPostsViewProtocol {
  func updateLabel(title: String) {
    exampleLabel.text = title
  }
}
