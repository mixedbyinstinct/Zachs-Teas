//
//  Tea.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//


import Foundation

struct Tea: Identifiable, Codable {
    let id: UUID
    let name: String
    let genre: String
    let year: Int?
    let season: String?
    let steeps: Int?
    let rating_hot: Int?
    let rating_iced: Int?
    let rating_coldbrew: Int?
    let created_at: String // or Date if you're parsing
}
