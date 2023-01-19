//
//  TitleTableViewCell.swift
//  Settings for iPhone
//
//  Created by Kristina Korotkova on 04/01/23.
//

import UIKit

final class TitleTableViewCell: UITableViewCell {
    
    static let identifier = Strings.textIdentifier
    
    // MARK: - Outlets
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize17
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
        super.init(style: style, reuseIdentifier: TitleTableViewCell.identifier)
        accessoryType = .disclosureIndicator
        setupHeirarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.fatalError)
    }
    
    // MARK: - Setup
    
    private func setupHeirarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(indicatorButton)
    }
    
    private func setupLayout() {
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(Metric.titleLabelLeftOffset)
            make.centerY.equalTo(contentView)
        }
        
        indicatorButton.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-Metric.buttonRightOffset)
            make.height.equalTo(Metric.diameter)
            make.width.greaterThanOrEqualTo(Metric.diameter)
        }
    }
    
    func configureView(with model: PaymentModel) {
        titleLabel.text = model.title
        indicatorButton.setTitle(model.numberInIndicator, for: .normal)
        indicatorButton.backgroundColor = hexStringToUIColor(hex: model.indicatorBackgroundColor ?? "")
    }
}

// MARK: - Constants

extension TitleTableViewCell {

    enum Strings {
        static let textIdentifier = "TitleTableViewCell"
        static let fatalError = "init(coder:) has not been implemented"
    }

    enum Metric {
        static let titleLabelLeftOffset = 20

        static let diameter: CGFloat = 26
        static let buttonCornerRadius: CGFloat = diameter / 2
        static let buttonContentEdgeInsetsTopAndBottom: CGFloat = 0
        static let buttonContentEdgeInsetsLeftAndRight: CGFloat = 5
        static let buttonRightOffset = 15
    }
}
