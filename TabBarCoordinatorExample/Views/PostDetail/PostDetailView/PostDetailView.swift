//
//  PostDetailView.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 25.07.23.
//

import UIKit


protocol PostDetailProtocol: AnyObject {
  var contentView: UIView! { get }
  var photoButton: UIButton! { get }
  var moreDetailButton: UIButton! { get }
  var sourceButton: UIButton! { get }

  var onMoreDetailButton: (() -> Void)? { get set }
  var onSourceButton: (() -> Void)? { get set }

  func photoButtonTapped()
  func moreDetailButtonTapped()
  func sourceButtonTapped()
}

protocol PostDetailDelegate: AnyObject {
  func onPhotoButton()
}

final class  PostDetailView: UIView, PostDetailProtocol {
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var photoButton: UIButton!
  @IBOutlet weak var moreDetailButton: UIButton!
  @IBOutlet weak var sourceButton: UIButton!

  var onMoreDetailButton: (() -> Void)?
  var onSourceButton: (() -> Void)?

  private weak var delegate: PostDetailDelegate?

  init(delegate: PostDetailDelegate?) {
    super.init(frame: .zero)
    self.delegate = delegate
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

  @IBAction func photoButtonTapped() {
    delegate?.onPhotoButton()
  }

  @IBAction func moreDetailButtonTapped() {
    onMoreDetailButton?()
  }

  @IBAction func sourceButtonTapped() {
    onSourceButton?()
  }
}
