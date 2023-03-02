//
//  Model.swift
//  AlbumScreen
//
//  Created by Ваня Сокол on 07.02.2023.
//

import UIKit

struct Section {
    let options: [AlbumsOption]
}

struct AlbumsOption {
    let name: String
    let icon: UIImage?
    var counter: String?
    var typeCell: AlbumsType
}

enum AlbumsType {
    case scrollCell
    case scrollCellWithHeart
    case scrollCellWithfourPhotos
    case listCell
    case listCellWithLock
}

