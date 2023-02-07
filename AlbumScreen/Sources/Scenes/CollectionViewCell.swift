//
//  CollectionViewCell.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 06.02.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let identifier = "CollectionViewCell"

    // MARK: - Outlets

    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var nameCell: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        addSubview(image)
        addSubview(nameCell)
        addSubview(countLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: leftAnchor),
            image.topAnchor.constraint(equalTo: topAnchor),
            image.rightAnchor.constraint(equalTo: rightAnchor),
            image.heightAnchor.constraint(equalToConstant: 180),

            nameCell.leftAnchor.constraint(equalTo: image.leftAnchor),
            nameCell.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),

            countLabel.leftAnchor.constraint(equalTo: nameCell.leftAnchor),
            countLabel.topAnchor.constraint(equalTo: nameCell.bottomAnchor, constant: 5),
        ])
    }


    // MARK: - Configuration

        override func prepareForReuse() {
            super.prepareForReuse()
            image.image = nil
            nameCell.text = nil
            countLabel.text = nil
        }
}
