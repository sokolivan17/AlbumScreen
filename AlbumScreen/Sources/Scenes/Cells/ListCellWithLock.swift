//
//  ListCellWithLock.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 07.02.2023.
//

import UIKit

class ListCellWithLock: ListCell {

    static let lockIdentifier = "ListCellWithLock"

    // MARK: - Outlets

    private lazy var lockImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "lock.fill")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .secondaryLabel
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        addSubview(lockImage)
        addSubview(chevronImage)
        addSubview(separator)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: leftAnchor),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.heightAnchor.constraint(equalToConstant: 30),
            image.widthAnchor.constraint(equalToConstant: 30),

            nameCell.leftAnchor.constraint(equalTo: image.rightAnchor,constant: 10),
            nameCell.centerYAnchor.constraint(equalTo: image.centerYAnchor),

            chevronImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            chevronImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevronImage.heightAnchor.constraint(equalToConstant: 20),
            chevronImage.widthAnchor.constraint(equalToConstant: 20),

            lockImage.rightAnchor.constraint(equalTo: chevronImage.leftAnchor, constant: -10),
            lockImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            lockImage.heightAnchor.constraint(equalToConstant: 20),
            lockImage.widthAnchor.constraint(equalToConstant: 20),

            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.leftAnchor.constraint(equalTo: leftAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }


    // MARK: - Configuration

    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        nameCell.text = nil
    }
}
