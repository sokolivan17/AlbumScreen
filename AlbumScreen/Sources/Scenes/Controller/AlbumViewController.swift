//
//  AlbumViewController.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 06.02.2023.
//

import UIKit

final class AlbumViewController: UIViewController {

    // MARK: - Properties

    var model: Section?

    private var albumView: AlbumView? {
        guard isViewLoaded else { return nil }
        return view as? AlbumView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = AlbumView()
        model = Section(options: [AlbumsOption]())
        configureView()
    }
}

// MARK: - Extension

private extension AlbumViewController {
    func configureView() {
        guard let models = model?.getSettingsCell() else { return }
        albumView?.configureView(with: models)

        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = true
        let leftButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftButton
    }
}

