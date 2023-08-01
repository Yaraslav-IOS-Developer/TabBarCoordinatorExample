//
//  NewPost.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 23.07.23.
//

import UIKit


protocol NewPostViewProtocol: AnyObject {
  var contentView: UIView! { get }
  var saveButton: UIButton! { get }
  var onSaveButton: (() -> Void)? { get set}

  func saveButtonTapped()
}

final class NewPostView: UIView, NewPostViewProtocol {
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var saveButton: UIButton!
  
  var onSaveButton: (() -> Void)?

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
  
  @IBAction func saveButtonTapped() {
    onSaveButton?()
  }
}
