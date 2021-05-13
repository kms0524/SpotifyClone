//
//  SettingsModels.swift
//  Spotify
//
//  Created by 강민성 on 2021/03/25.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
