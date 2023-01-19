//
//  SettingsScreenView.swift
//  Setting App
//
//  Created by Kristina Korotkova on 19/01/23.
//

import UIKit

final class SettingsScreenView: UIView {

    // MARK: - Outlets

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UserTableViewCell.self,
                           forCellReuseIdentifier: UserTableViewCell.identifier)
        tableView.register(FamilyTableViewCell.self,
                           forCellReuseIdentifier: FamilyTableViewCell.identifier)
        tableView.register(DefaultTableViewCell.self,
                           forCellReuseIdentifier: DefaultTableViewCell.identifier)
        tableView.register(SwitchTableViewCell.self,
                           forCellReuseIdentifier: SwitchTableViewCell.identifier)
        tableView.register(TitleTableViewCell.self,
                           forCellReuseIdentifier: TitleTableViewCell.identifier)
        return tableView
    }()

    // MARK: - Initial

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupHeirarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHeirarchy() {
        addSubview(tableView)
    }

    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(self)
        }
    }
}
