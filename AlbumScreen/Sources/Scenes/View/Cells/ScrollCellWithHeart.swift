//
//  ScrollCellWithHeart.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 07.02.2023.
//

import UIKit

class ScrollCellWithHeart: ScrollCell {

    static let heartIdentifier = "ScrollCellWithHeart"

    // MARK: - Outlets

    private lazy var heartImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "heart.fill")
        imageView.tintColor = .white
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
        addSubview(countLabel)
        addSubview(heartImage)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            image.leftAnchor.constraint(equalTo: leftAnchor),
            image.topAnchor.constraint(equalTo: topAnchor),
            image.rightAnchor.constraint(equalTo: rightAnchor),
            image.heightAnchor.constraint(equalToConstant: 180),

            heartImage.leftAnchor.constraint(equalTo: image.leftAnchor, constant: 5),
            heartImage.bottomAnchor.constraint(equalTo: image.bottomAnchor, constant: -5),
            heartImage.heightAnchor.constraint(equalToConstant: Metrics.heightAndWidthHeartImage),
            heartImage.widthAnchor.constraint(equalToConstant: Metrics.heightAndWidthHeartImage),

            nameCell.leftAnchor.constraint(equalTo: image.leftAnchor),
            nameCell.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),

            countLabel.leftAnchor.constraint(equalTo: nameCell.leftAnchor),
            countLabel.topAnchor.constraint(equalTo: nameCell.bottomAnchor, constant: 5),
        ])
    }
}

// MARK: - Consatnts

extension ScrollCellWithHeart {
    enum Metrics {
        static let heightAndWidthHeartImage: CGFloat = 20
    }
}
