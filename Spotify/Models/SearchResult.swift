//
//  SearchResult.swift
//  Spotify
//
//  Created by 강민성 on 2021/05/04.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
