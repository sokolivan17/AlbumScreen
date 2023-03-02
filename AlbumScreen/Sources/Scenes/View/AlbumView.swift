//
//  AlbumView.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 02.03.2023.
//

import UIKit

class AlbumView: UIView {

    // MARK: - Configuration

    func configureView(with models: [Section]) {
        self.cellsData = models
        collectionView.reloadData()
    }

    // MARK: - Private properties

    private var cellsData = [Section]()

    // MARK: - Views

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ScrollCell.self, forCellWithReuseIdentifier: ScrollCell.identifier)
        collectionView.register(ScrollCellWithFourImages.self, forCellWithReuseIdentifier: ScrollCellWithFourImages.fourImagesIdentifier)
        collectionView.register(ScrollCellWithHeart.self, forCellWithReuseIdentifier: ScrollCellWithHeart.heartIdentifier)
        collectionView.register(ListCell.self, forCellWithReuseIdentifier: ListCell.identifier)
        collectionView.register(ListCellWithLock.self, forCellWithReuseIdentifier: ListCellWithLock.lockIdentifier)
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
        addSubview(collectionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
        collectionView.leftAnchor.constraint(equalTo: leftAnchor),
        collectionView.topAnchor.constraint(equalTo: topAnchor),
        collectionView.rightAnchor.constraint(equalTo: rightAnchor),
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in

            switch sectionIndex {

            case 0:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalHeight(0.5))
                let contentInset = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)

                let topItem = NSCollectionLayoutItem(layoutSize: itemSize)
                topItem.contentInsets = contentInset

                let bottomItem = NSCollectionLayoutItem(layoutSize: itemSize)
                bottomItem.contentInsets = contentInset

                let nestedGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(180), heightDimension: .absolute(480)),
                    subitems: [topItem, bottomItem]
                )

                let sectionLayout = NSCollectionLayoutSection(group: nestedGroup)
                sectionLayout.contentInsets = .init(top: 0, leading: 20, bottom: 20, trailing: 0)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                                     heightDimension: .estimated(60))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]

                return sectionLayout

            case 1:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.49),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 12)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                       heightDimension: .fractionalHeight(0.3))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                                     heightDimension: .estimated(60))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]

                return sectionLayout

            case 2:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(50))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitems: [layoutItem])

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0)

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                                     heightDimension: .estimated(60))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]

                return sectionLayout

            case 3:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .absolute(50))
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                     subitems: [layoutItem])

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0)

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.98),
                                                                     heightDimension: .estimated(60))
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]

                return sectionLayout

            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2),
                                                       heightDimension: .fractionalHeight(1 / 1.5))
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: layoutItem, count: 2)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                return sectionLayout
            }
        }
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension AlbumView: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cellsData.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellsData[section].options.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = cellsData[indexPath.section].options[indexPath.row]

        switch model.typeCell {
        case .scrollCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrollCell.identifier, for: indexPath) as? ScrollCell
            cell?.configure(cell: model)
            return cell ?? UICollectionViewCell()
        case .scrollCellWithfourPhotos:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrollCellWithFourImages.fourImagesIdentifier, for: indexPath) as? ScrollCellWithFourImages
            cell?.configure(cell: model)
            return cell ?? UICollectionViewCell()
        case .scrollCellWithHeart:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrollCellWithHeart.heartIdentifier, for: indexPath) as? ScrollCellWithHeart
            cell?.configure(cell: model)
            return cell ?? UICollectionViewCell()
        case .listCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as? ListCell
            cell?.configure(cell: model, lastCell: indexPath.item == (cellsData[indexPath.section].options.count - 1))
            return cell ?? UICollectionViewCell()
        case .listCellWithLock:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCellWithLock.lockIdentifier, for: indexPath) as? ListCellWithLock
            cell?.configure(cell: model, lastCell: indexPath.item == (cellsData[indexPath.section].options.count - 1))
            return cell ?? UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
            header.header.text = "My Albums"
            header.button.setTitle("See All", for: .normal)
            return header
        case 1:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
            header.header.text = "People & Places"
            return header
        case 2:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
            header.header.text = "Media Types"
            return header
        case 3:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
            header.header.text = "Utilities"
            return header
        default:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
            header.header.text = "Header"
            return header
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = cellsData[indexPath.section].options[indexPath.row]

        switch model.typeCell {
        case .scrollCell:
            print("Нажата ячейка \(model.name)")
        case .scrollCellWithHeart:
            print("Нажата ячейка \(model.name)")
        case .scrollCellWithfourPhotos:
            print("Нажата ячейка \(model.name)")
        case .listCell:
            print("Нажата ячейка \(model.name)")
        case .listCellWithLock:
            print("Нажата ячейка \(model.name)")
        }
    }
}
