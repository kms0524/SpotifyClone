//
//  Artist.swift
//  Spotify
//
//  Created by 강민성 on 2021/03/11.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let images: [APIImage]?
    let external_urls: [String: String]
}
