//
//  LibraryAlbumsResponse.swift
//  Spotify
//
//  Created by 강민성 on 2021/05/11.
//

import Foundation

struct LibraryAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
