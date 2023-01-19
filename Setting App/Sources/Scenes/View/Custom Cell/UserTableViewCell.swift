//
//  UserTableViewCell.swift
//  Setting App
//
//  Created by Kristina Korotkova on 19/01/23.
//

import UIKit

final class UserTableViewCell: UITableViewCell {

    static let identifier = Strings.textIdentifier

    // MARK: - Outlets

    private lazy var imageContainerView: UIView = {
        let container = UIView()
        container.addSubview(userImageView)
        return container
    }()

    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Metric.imageViewCornerRadius
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize24
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.regularOfSize12
        return label
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = Metric.stackSpacing
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(subtitleLabel)
        return stack
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
        contentView.addSubview(stack)
    }

    private func setupLayout() {

        userImageView.snp.makeConstraints { make in
            make.top.right.bottom.left.equalTo(imageContainerView)
            make.center.equalTo(imageContainerView)
        }

        imageContainerView.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(Metric.imageContainerViewLeftOffset)
            make.centerY.equalTo(contentView)
            make.width.height.equalTo(Metric.imageContainerViewHeightAndWidth)
        }

        stack.snp.makeConstraints { make in
            make.left.equalTo(imageContainerView.snp.right).offset(Metric.stackLeftOffset)
            make.centerY.equalTo(contentView)
        }
    }

    func configureView(with model: UserModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subTitle
        userImageView.image = UIImage(named: model.imageUserOne)
    }
}

// MARK: - Constants

extension UserTableViewCell {

    enum Strings {
        static let textIdentifier = "UserTableViewCell"
        static let fatalError = "init(coder:) has not been implemented"
    }

    enum Metric {
        static let imageContainerViewHeightAndWidth = 60
        static let imageContainerViewLeftOffset = 20

        static let imageViewCornerRadius: CGFloat = 30

        static let stackSpacing: CGFloat = 2
        static let stackLeftOffset = 15
    }
}
