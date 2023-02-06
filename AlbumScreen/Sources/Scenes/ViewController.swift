//
//  ViewController.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 06.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Albums"
        navigationController?.navigationBar.prefersLargeTitles = true
        let leftButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftButton
    }


}

