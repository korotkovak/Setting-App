//
//  FamilyTableViewCell.swift
//  Settings for iPhone
//
//  Created by Kristina Korotkova on 03/01/23.
//

import UIKit

final class FamilyTableViewCell: UITableViewCell {
    
    static let identifier = Strings.textIdentifier
    
    // MARK: - Outlets
    
    private lazy var imageContainerView: UIView = {
        let container = UIView()
        container.addSubview(userFirstImageView)
        container.addSubview(userSecondImageView)
        return container
    }()
    
    private lazy var userFirstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metric.imageViewCornerRadius
        imageView.layer.borderColor = Colors.white.cgColor
        imageView.layer.borderWidth = Metric.imageViewBorderWidth
        return imageView
    }()
    
    private lazy var userSecondImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metric.imageViewCornerRadius
        imageView.layer.borderColor = Colors.white.cgColor
        imageView.layer.borderWidth = Metric.imageViewBorderWidth
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize17
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: UserTableViewCell.identifier)
        accessoryType = .disclosureIndicator
        setupHeirarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.fatalError)
    }
    
    // MARK: - Setup
    
    private func setupHeirarchy() {
        contentView.addSubview(imageContainerView)
        contentView.addSubview(titleLabel)
    }
    
    private func setupLayout() {
        
        userFirstImageView.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(imageContainerView)
            make.height.width.equalTo(Metric.userHeightAndWidth)
        }
        
        userSecondImageView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(imageContainerView)
            make.height.width.equalTo(Metric.userHeightAndWidth)
        }
        
        imageContainerView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(Metric.imageContainerViewLeftOffset)
            make.centerY.equalTo(contentView)
            make.width.equalTo(Metric.imageContainerViewWidth)
            make.height.equalTo(Metric.imageContainerViewHeight)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(imageContainerView)
            make.left.equalTo(imageContainerView.snp.right).offset(Metric.titleLabelLeftOffset)
        }
    }
    
    func configureView(with model: FamilyModel) {
        titleLabel.text = model.title
        userFirstImageView.image = UIImage(named: model.imageUserOne)
        userSecondImageView.image = UIImage(named: model.imageUserTwo)
    }
}

// MARK: - Constants

extension FamilyTableViewCell {

    enum Strings {
        static let textIdentifier = "FamilyTableViewCell"
        static let fatalError = "init(coder:) has not been implemented"
    }

    enum Metric {
        static let imageContainerViewHeight = 35
        static let imageContainerViewWidth = 60
        static let imageContainerViewLeftOffset = 20

        static let imageViewCornerRadius: CGFloat = 18
        static let imageViewBorderWidth: CGFloat = 1

        static let userHeightAndWidth = 35

        static let titleLabelLeftOffset = 15
    }
}
