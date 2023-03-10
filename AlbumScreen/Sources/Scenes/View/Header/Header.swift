//
//  Header.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 06.02.2023.
//

import UIKit

class Header: UICollectionReusableView {

    static let identifier = "Header"

    // MARK: - Outlets

    lazy var header: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var separator: UIView = {
        let separator = UIView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = .quaternaryLabel
        return separator
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(header)
        addSubview(separator)
        addSubview(button)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.leftAnchor.constraint(equalTo: leftAnchor),
            separator.topAnchor.constraint(equalTo: topAnchor),
            separator.rightAnchor.constraint(equalTo: rightAnchor),

            header.leftAnchor.constraint(equalTo: leftAnchor),
            header.centerYAnchor.constraint(equalTo: centerYAnchor),

            button.rightAnchor.constraint(equalTo: rightAnchor, constant: -22),
            button.bottomAnchor.constraint(equalTo: header.bottomAnchor)
        ])
    }

// MARK: - Configuration

    override func prepareForReuse() {
        super.prepareForReuse()
        header.text = nil
        button.setTitle(nil, for: .normal)
    }
}
