//
//  ScrollCell.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 06.02.2023.
//

import UIKit

class ScrollCell: UICollectionViewCell {

    static let identifier = "ScrollCell"

    // MARK: - Outlets

    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Metrics.imageCornerRadius
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var nameCell: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metrics.fontSize, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var countLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Metrics.fontSize, weight: .regular)
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
            countLabel.topAnchor.constraint(equalTo: nameCell.bottomAnchor, constant: 3),
        ])
    }


    // MARK: - Configuration
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        nameCell.text = nil
        countLabel.text = nil
    }

    public func configure(cell: AlbumsOption) {
        image.image = cell.icon
        nameCell.text = cell.name
        countLabel.text = cell.counter
    }
}

extension ScrollCell {
    enum Metrics {
        static let fontSize: CGFloat = 15
        static let imageCornerRadius: CGFloat = 6
    }
}
