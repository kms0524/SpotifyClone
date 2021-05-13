//
//  Playlist.swift
//  Spotify
//
//  Created by 강민성 on 2021/03/11.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}
