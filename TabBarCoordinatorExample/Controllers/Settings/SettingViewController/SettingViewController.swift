//
//  SettingViewController.swift
//  TabBarCoordinatorExample
//
//  Created by Yaroslav on 18.07.23.
//

import UIKit


protocol SettingViewControllerDelegate: AnyObject {
  func didSelectCell(settingsNavigation: SettingsNavigation)
}

final class SettingViewController: UIViewController {
  private var containerView: SettingView! {
    return view as? SettingView
  }

  private let viewModel: SettingsViewModel
  private weak var settingViewControllerDelegate: SettingViewControllerDelegate?

  init(viewModel: SettingsViewModel, settingViewControllerDelegate: SettingViewControllerDelegate?) {
    self.viewModel = viewModel
    self.settingViewControllerDelegate = settingViewControllerDelegate
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = SettingView()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
  }

  private func setupTableView() {
    registerCell()
    containerView.tableView.delegate = self
    containerView.tableView.dataSource = self
    containerView.tableView.backgroundColor = .systemGroupedBackground
  }

  private func registerCell() {
    containerView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }
}

extension SettingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.settingCount
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let viewModel = viewModel.getItemSettingViewModel(row: indexPath.row)

    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    var contentConfiguration = cell.defaultContentConfiguration()
    contentConfiguration.text = viewModel.title
    contentConfiguration.image = UIImage(systemName: viewModel.icon)
    cell.contentConfiguration = contentConfiguration

    if !viewModel.isNavigation {
      cell.selectionStyle = .none
    }
    return cell
  }
}

extension SettingViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let navigation = viewModel.cellSelected(row: indexPath.row)
    settingViewControllerDelegate?.didSelectCell(settingsNavigation: navigation)
  }
}
