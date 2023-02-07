//
//  ScrollCellWithFourImages.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 07.02.2023.
//

import UIKit

class ScrollCellWithFourImages: ScrollCell {

    static let fourImagesIdentifier = "ScrollCellWithFourImages"

    // MARK: - Outlets

    private lazy var firstImage: UIImageView = {
        setupImages(name: "image")
    }()

    private lazy var secondImage: UIImageView = {
        setupImages(name: "image1")
    }()

    private lazy var thirdImage: UIImageView = {
        setupImages(name: "image2")
    }()

    private lazy var fourthImage: UIImageView = {
        setupImages(name: "image3")
    }()

    private func setupImages(name: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: name)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = (Metrics.heightAndWidthImages / 2)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }

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
        addSubview(firstImage)
        addSubview(secondImage)
        addSubview(thirdImage)
        addSubview(fourthImage)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            firstImage.leftAnchor.constraint(equalTo: leftAnchor),
            firstImage.topAnchor.constraint(equalTo: topAnchor),
            firstImage.heightAnchor.constraint(equalToConstant: Metrics.heightAndWidthImages),
            firstImage.widthAnchor.constraint(equalToConstant: Metrics.heightAndWidthImages),

            secondImage.leftAnchor.constraint(equalTo: firstImage.rightAnchor,constant: Metrics.distanceBetweenImages),
            secondImage.topAnchor.constraint(equalTo: topAnchor),
            secondImage.heightAnchor.constraint(equalToConstant: Metrics.heightAndWidthImages),
            secondImage.widthAnchor.constraint(equalToConstant: Metrics.heightAndWidthImages),

            thirdImage.leftAnchor.constraint(equalTo: leftAnchor),
            thirdImage.topAnchor.constraint(equalTo: firstImage.bottomAnchor, constant: Metrics.distanceBetweenImages),
            thirdImage.heightAnchor.constraint(equalToConstant: Metrics.heightAndWidthImages),
            thirdImage.widthAnchor.constraint(equalToConstant: Metrics.heightAndWidthImages),

            fourthImage.leftAnchor.constraint(equalTo: thirdImage.rightAnchor, constant: Metrics.distanceBetweenImages),
            fourthImage.topAnchor.constraint(equalTo: secondImage.bottomAnchor, constant: Metrics.distanceBetweenImages),
            fourthImage.heightAnchor.constraint(equalToConstant: Metrics.heightAndWidthImages),
            fourthImage.widthAnchor.constraint(equalToConstant: Metrics.heightAndWidthImages),

            nameCell.leftAnchor.constraint(equalTo: image.leftAnchor),
            nameCell.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),

            countLabel.leftAnchor.constraint(equalTo: nameCell.leftAnchor),
            countLabel.topAnchor.constraint(equalTo: nameCell.bottomAnchor, constant: 5),
        ])
    }
}

extension ScrollCellWithFourImages {
    enum Metrics {
        static let heightAndWidthImages: CGFloat = 82
        static let distanceBetweenImages: CGFloat = 4
    }
}
