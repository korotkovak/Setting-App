//
//  SwitchTableViewCell.swift
//  Settings for iPhone
//
//  Created by Kristina Korotkova on 02/01/23.
//

import UIKit

final class SwitchTableViewCell: UITableViewCell {
    
    static let identifier = Strings.textIdentifier
    
    // MARK: - Outlets
    
    private lazy var iconContainerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = Metric.iconContainerViewCornerRadius
        container.addSubview(iconImageView)
        return container
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = Colors.white
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize17
        return label
    }()
    
    private lazy var switchInCell: UISwitch = {
        let switchCell = UISwitch()
        switchCell.onTintColor = Colors.green
        switchCell.tintColor = Colors.gray
        switchCell.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
        switchCell.setOn(true, animated: true)
        return switchCell
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SwitchTableViewCell.identifier)
        accessoryType = .none
        setupHeirarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.fatalError)
    }
    
    // MARK: - Setup
    
    private func setupHeirarchy() {
        contentView.addSubview(iconContainerView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(switchInCell)
    }
    
    private func setupLayout() {
        
        iconImageView.snp.makeConstraints { make in
            make.center.equalTo(iconContainerView)
            make.width.height.equalTo(Metric.iconImageViewHeightAndWidth)
        }
        
        iconContainerView.snp.makeConstraints { make in
            make.height.width.equalTo(Metric.iconContainerViewHeightAndWidth)
            make.left.equalTo(contentView).offset(Metric.iconContainerViewLeftOffset)
            make.centerY.equalTo(contentView)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(iconContainerView.snp.right).offset(Metric.titleLabelLeftOffset)
            make.centerY.equalTo(contentView)
        }
        
        switchInCell.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-Metric.switchInCellRightOffset)
        }
    }
    
    func configureView(with model: SwitchModel) {
        titleLabel.text = model.title
        switchInCell.isOn = model.isOn
        iconImageView.image = UIImage(systemName: model.icon)
        iconContainerView.backgroundColor = hexStringToUIColor(hex: model.iconBackgroundColor)
    }
}

// MARK: - Action

extension SwitchTableViewCell {
    @objc func switchStateDidChange(_ sender: UISwitch!) {
        guard sender.isOn else {
            if titleLabel.text == Strings.titleLabelText {
                print("UISwitch state is now Off")
                iconImageView.image = UIImage(systemName: Icons.isOffVpn)
            } else {
                print("UISwitch state is now Off")
                iconImageView.image = UIImage(systemName: Icons.isOffAirplane)
            }
            return
        }

        if titleLabel.text == Strings.titleLabelText {
            print("UISwitch state is now ON")
            iconImageView.image = UIImage(systemName: Icons.isOnVpn)
        } else {
            print("UISwitch state is now ON")
            iconImageView.image = UIImage(systemName: Icons.isOnAirplane)
        }
    }
}

// MARK: - Constants

extension SwitchTableViewCell {

    enum Strings {
        static let textIdentifier = "SwitchTableViewCell"
        static let fatalError = "init(coder:) has not been implemented"
        static let titleLabelText = "VPN"
    }

    enum Icons {
        static let isOnVpn = "lock.fill"
        static let isOffVpn = "lock.open.fill"
        static let isOnAirplane = "antenna.radiowaves.left.and.right.slash"
        static let isOffAirplane = "airplane"
    }

    enum Metric {
        static let iconImageViewHeightAndWidth = 22

        static let iconContainerViewCornerRadius: CGFloat = 7
        static let iconContainerViewHeightAndWidth = 28
        static let iconContainerViewLeftOffset = 20

        static let titleLabelLeftOffset = 15

        static let switchInCellRightOffset = 20
    }
}
