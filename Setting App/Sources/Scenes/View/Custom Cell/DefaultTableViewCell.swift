//
//  DefaultTableViewCell.swift
//  Settings for iPhone
//
//  Created by Kristina Korotkova on 02/01/23.
//

import UIKit

final class DefaultTableViewCell: UITableViewCell {
    
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
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize17
        label.textColor = Colors.gray
        return label
    }()

    private lazy var indicatorButton: UIButton = {
        let button = UIButton()
        button.contentEdgeInsets = UIEdgeInsets(top: Metric.buttonContentEdgeInsetsTopAndBottom,
                                                left: Metric.buttonContentEdgeInsetsLeftAndRight,
                                                bottom: Metric.buttonContentEdgeInsetsTopAndBottom,
                                                right: Metric.buttonContentEdgeInsetsLeftAndRight)
        button.layer.cornerRadius = Metric.buttonCornerRadius
        button.setTitleColor(Colors.white, for: .normal)
        button.titleLabel?.font = Fonts.regularOfSize16
        return button
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: DefaultTableViewCell.identifier)
        accessoryType = .disclosureIndicator
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
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(indicatorButton)
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

        subtitleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-Metric.subtitleLabelRightOffset)
        }

        indicatorButton.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-Metric.buttonRightOffset)
            make.height.equalTo(Metric.diameter)
            make.width.greaterThanOrEqualTo(Metric.diameter)
        }
    }
    
    func configureView(with model: DefaultModel) {
        titleLabel.text = model.title
        iconContainerView.backgroundColor = hexStringToUIColor(hex: model.iconBackgroundColor)
        subtitleLabel.text = model.subTitle

        if UIImage(systemName: model.icon) != nil {
            iconImageView.image = UIImage(systemName: model.icon)
        } else {
            iconImageView.image = UIImage(named: model.icon)
        }

        if model.numberIndicator != "" {
            indicatorButton.setTitle(model.numberIndicator, for: .normal)
            indicatorButton.backgroundColor = Colors.red
        } else {
            indicatorButton.backgroundColor = nil
        }
    }
}

// MARK: - Constants

extension DefaultTableViewCell {

    enum Strings {
        static let textIdentifier = "DefaultTableViewCell"
        static let fatalError = "init(coder:) has not been implemented"
    }

    enum Metric {
        static let iconImageViewHeightAndWidth = 22

        static let iconContainerViewCornerRadius: CGFloat = 7
        static let iconContainerViewHeightAndWidth = 28
        static let iconContainerViewLeftOffset = 20

        static let titleLabelLeftOffset = 15

        static let subtitleLabelRightOffset = 10

        static let diameter: CGFloat = 26
        static let buttonCornerRadius: CGFloat = diameter / 2
        static let buttonContentEdgeInsetsTopAndBottom: CGFloat = 0
        static let buttonContentEdgeInsetsLeftAndRight: CGFloat = 5
        static let buttonRightOffset = 15
    }
}
