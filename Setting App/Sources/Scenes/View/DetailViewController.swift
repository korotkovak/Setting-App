//
//  DetailViewController.swift
//  Setting App
//
//  Created by Kristina Korotkova on 19/01/23.
//

import UIKit

final class DetailViewController: UIViewController {

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
        label.font = Fonts.regularOfSize30
        label.textAlignment = .center
        return label
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = Metric.stackSpacing
        stack.addArrangedSubview(iconContainerView)
        stack.addArrangedSubview(titleLabel)
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHeirarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupView() {
        view.backgroundColor = Colors.white
    }

    private func setupHeirarchy() {
        view.addSubview(stack)
    }

    private func setupLayout() {

        iconImageView.snp.makeConstraints { make in
            make.center.equalTo(iconContainerView)
            make.width.height.equalTo(Metric.iconImageViewHeightAndWidth)
        }

        iconContainerView.snp.makeConstraints { make in
            make.height.width.equalTo(Metric.iconContainerViewHeightAndWidth)
        }

        stack.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }

    func fillSettings(with model: ModelProtocol) {
        titleLabel.text = model.title
        iconContainerView.backgroundColor = hexStringToUIColor(hex: model.iconBackgroundColor)

        guard (UIImage(systemName: model.icon) != nil) else {
            return iconImageView.image = UIImage(named: model.icon)
        }

        iconImageView.image = UIImage(systemName: model.icon)
    }
}

// MARK: - Constants

extension DetailViewController {

    enum Metric {
        static let iconImageViewHeightAndWidth = 80

        static let iconContainerViewCornerRadius: CGFloat = 20
        static let iconContainerViewHeightAndWidth = 130

        static let stackSpacing: CGFloat = 20
    }
}
