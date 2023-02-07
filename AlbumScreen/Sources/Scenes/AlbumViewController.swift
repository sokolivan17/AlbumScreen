//
//  AlbumViewController.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 06.02.2023.
//

import UIKit

class AlbumViewController: UIViewController {

    // MARK: - Outlets

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
        collectionView.register(ListCellWithLock.self, forCellWithReuseIdentifier: ListCellWithLock.identifier)
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        let leftButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftButton

        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
        collectionView.topAnchor.constraint(equalTo: view.topAnchor),
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension AlbumViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return 2
        case 2:
            return 10
        case 3:
            return 4
        default:
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrollCell.identifier, for: indexPath) as! ScrollCell
            cell.image.image = UIImage(systemName: "house")
            cell.nameCell.text = "Recents"
            cell.countLabel.text = "483"
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrollCellWithFourImages.fourImagesIdentifier, for: indexPath) as! ScrollCellWithFourImages
            cell.nameCell.text = "Recents"
            cell.countLabel.text = "483"
            cell.backgroundColor = .systemOrange
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.identifier, for: indexPath) as! ListCell
            cell.image.image = UIImage(systemName: "video")
            cell.nameCell.text = "Videos"
            cell.countLabel.text = "1039"
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCellWithLock.identifier, for: indexPath) as! ListCellWithLock
            cell.image.image = UIImage(systemName: "square.and.arrow.down")
            cell.nameCell.text = "Imports"
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScrollCell.identifier, for: indexPath)
            cell.backgroundColor = .systemGreen
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {


        switch indexPath.section {
        case 0:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Header.identifier, for: indexPath) as! Header
            header.header.text = "My albums"
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
                    layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(180), heightDimension: .absolute(500)),
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
                                                       heightDimension: .fractionalHeight(0.32))
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

