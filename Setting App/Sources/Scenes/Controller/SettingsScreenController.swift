//
//  SettingsScreenController.swift
//  Setting App
//
//  Created by Kristina Korotkova on 19/01/23.
//

import UIKit

final class SettingsScreenController: UIViewController {

    private var model = SettingsScreenModel()
    private let detailController = DetailViewController()

    private var settingsScreenView: SettingsScreenView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsScreenView
    }

    // MARK: - Leficycle

    override func loadView() {
        view = SettingsScreenView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureView()
    }

    // MARK: - Setup

    private func setupView() {
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func configureView() {
        settingsScreenView?.tableView.delegate = self
        settingsScreenView?.tableView.dataSource = self
    }
}

extension SettingsScreenController {
    private func separatorDefailt() {
        settingsScreenView?.tableView.separatorInset = UIEdgeInsets(top: Metric.separatorTopRightBottomOffset,
                                                                    left: Metric.separatorDefailtLeftOffset,
                                                                    bottom: Metric.separatorTopRightBottomOffset,
                                                                    right: Metric.separatorTopRightBottomOffset)
    }

    private func separatorUser() {
        settingsScreenView?.tableView.separatorInset = UIEdgeInsets(top: Metric.separatorTopRightBottomOffset,
                                                                    left: Metric.separatorForUserCellLeftOffset,
                                                                    bottom: Metric.separatorTopRightBottomOffset,
                                                                    right: Metric.separatorTopRightBottomOffset)
    }
}

extension SettingsScreenController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        model.configurations.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.configurations[section].options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = model.configurations[indexPath.section].options[indexPath.row]

        switch model {
        case .userCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserTableViewCell.identifier,
                for: indexPath
            ) as? UserTableViewCell else { return UITableViewCell() }
            cell.configureView(with: model)
            return cell
        case .familyCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: FamilyTableViewCell.identifier,
                for: indexPath
            ) as? FamilyTableViewCell else { return UITableViewCell() }
            cell.configureView(with: model)
            return cell
        case .defaultCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DefaultTableViewCell.identifier,
                for: indexPath
            ) as? DefaultTableViewCell else { return UITableViewCell() }
            cell.configureView(with: model)
            return cell
        case .switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath
            ) as? SwitchTableViewCell else { return UITableViewCell() }
            cell.configureView(with: model)
            return cell
        case .paymentCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TitleTableViewCell.identifier,
                for: indexPath
            ) as? TitleTableViewCell else { return UITableViewCell() }
            cell.configureView(with: model)
            return cell
        }
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            model.configurations[indexPath.section].options.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}

// MARK: - Delegate

extension SettingsScreenController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = model.configurations[indexPath.section].options[indexPath.row]

        switch model {
        case .userCell(_):
            separatorUser()
            return Metric.userHeightForRow
        case .familyCell(_):
            separatorUser()
            return Metric.defaultHeightForRow
        default:
            separatorDefailt()
            return Metric.defaultHeightForRow
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = model.configurations[indexPath.section].options[indexPath.row]

        switch model {
        case .userCell(_):
            separatorUser()
        case .familyCell(_):
            separatorUser()
        case .defaultCell(let model):
            separatorDefailt()
            detailController.fillSettings(with: model)
        case .switchCell(let model):
            separatorDefailt()
            detailController.fillSettings(with: model)
        case .paymentCell(_):
            separatorUser()
        }

        navigationController?.pushViewController(detailController, animated: true)
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let model = model.configurations[indexPath.section].options[indexPath.row]

        switch model {
        case .userCell(_):
            return false
        case .familyCell(_):
            return false
        case .switchCell(let model):
            if model.title == "Авиарежим" {
                return false
            } else {
                return true
            }
        case .paymentCell(_):
            return false
        default:
            return true
        }
    }
}

// MARK: - Constants

extension SettingsScreenController {

    enum Metric {
        static let defaultHeightForRow: CGFloat = 46
        static let userHeightForRow: CGFloat = 80

        static let separatorTopRightBottomOffset: CGFloat = 0
        static let separatorDefailtLeftOffset: CGFloat = 63
        static let separatorForUserCellLeftOffset: CGFloat = 95
    }
}
