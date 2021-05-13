//
//  AllCategoriesResponse.swift
//  Spotify
//
//  Created by 강민성 on 2021/05/02.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
}

struct Category: Codable {
    let id: String
    let name: String
    let icons: [APIImage]
}
