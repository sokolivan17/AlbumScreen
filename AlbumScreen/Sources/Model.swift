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
    case scrollCellWithfourPhotos
    case listCell
    case listCellWithLock
}

extension Section {
    static func getSettingsCell() -> [Section] {
        return [
            Section(options: [
                AlbumsOption(name: <#T##String#>, icon: <#T##UIImage#>, counter: 5959, typeCell: .scrollCell),
                AlbumsOption(name: <#T##String#>, icon: <#T##UIImage#>, counter: 13, typeCell: .scrollCell),
                AlbumsOption(name: <#T##String#>, icon: <#T##UIImage#>, counter: <#T##String#>, typeCell: .scrollCell),
                AlbumsOption(name: <#T##String#>, icon: <#T##UIImage#>, counter: <#T##String#>, typeCell: .scrollCell),
                AlbumsOption(name: <#T##String#>, icon: <#T##UIImage#>, counter: <#T##String#>, typeCell: .scrollCell),
                AlbumsOption(name: <#T##String#>, icon: <#T##UIImage#>, counter: <#T##String#>, typeCell: .scrollCell),
                AlbumsOption(name: <#T##String#>, icon: <#T##UIImage#>, counter: <#T##String#>, typeCell: .scrollCell)
            ]),
            Section(options: [
                AlbumsOption(name: "People", icon: nil, counter: "17", typeCell: .scrollCellWithfourPhotos),
                AlbumsOption(name: "Places", icon: <#T##UIImage#>, counter: "5117", typeCell: .scrollCell)
            ]),
            Section(options: [
                AlbumsOption(name: "Videos", icon: UIImage(systemName: "video"), counter: "1039", typeCell: .listCell),
                AlbumsOption(name: "Selfies", icon: UIImage(systemName: "person.crop.square"), counter: "450", typeCell: .listCell),
                AlbumsOption(name: "Live Photos", icon: UIImage(systemName: "livephoto"), counter: "645", typeCell: .listCell),
                AlbumsOption(name: "Portrait", icon: UIImage(systemName: "cube"), counter: "39", typeCell: .listCell),
                AlbumsOption(name: "Long Exposure", icon: UIImage(systemName: "timelapse"), counter: "4", typeCell: .listCell),
                AlbumsOption(name: "Time-lapse", icon: UIImage(systemName: "slowmo"), counter: "3", typeCell: .listCell),
                AlbumsOption(name: "Slo-mo", icon: UIImage(systemName: "square.stack.3d.down.right"), counter: "20", typeCell: .listCell),
                AlbumsOption(name: "Bursts", icon: UIImage(systemName: "camera.viewfinder"), counter: "2", typeCell: .listCell),
                AlbumsOption(name: "Screenshots", icon: UIImage(systemName: "camera.viewfinder"), counter: "373", typeCell: .listCell),
                AlbumsOption(name: "Animated", icon: UIImage(systemName: "square.stack.3d.forward.dottedline"), counter: "2", typeCell: .listCell)
            ]),
            Section(options: [
                AlbumsOption(name: "Imports", icon: UIImage(systemName: "square.and.arrow.down"), counter: "875", typeCell: .listCell),
                AlbumsOption(name: "Duplicates", icon: UIImage(systemName: "square.on.square"), counter: "47", typeCell: .listCell),
                AlbumsOption(name: "Hidden", icon: UIImage(systemName: "eye.slash"), typeCell: .listCellWithLock),
                AlbumsOption(name: "Recently Deleted", icon: UIImage(systemName: "trash"), typeCell: .listCellWithLock)
            ]),
        ]
    }
}
