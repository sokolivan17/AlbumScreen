//
//  SceneDelegate.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 06.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let tabBarController = UITabBarController()

        let libraryViewController = UIViewController()
        libraryViewController.view.backgroundColor = .systemGray2
        libraryViewController.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)

        let foryouViewController = UIViewController()
        foryouViewController.view.backgroundColor = .systemOrange
        foryouViewController.tabBarItem = UITabBarItem(title: "For You", image: UIImage(systemName: "heart.text.square.fill"), tag: 1)

        let albumsNavigationController = UINavigationController(rootViewController: AlbumViewController())
        albumsNavigationController.tabBarItem = UITabBarItem(title: "Albums", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)

        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .systemTeal
        searchViewController.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 3)

        tabBarController.setViewControllers([
            libraryViewController,
            foryouViewController,
            albumsNavigationController,
            searchViewController
        ], animated: true)
        tabBarController.selectedIndex = 2

        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

