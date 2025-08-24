//
//  TeaDetail.swift
//  Zach's Teas
//
//  Created by Zach Baron on 8/23/25.
//
import Foundation

struct TeaDetail: Identifiable, Decodable {
    let id: UUID
    let name: String
    let genre: String
    let year: Int
    let season: String
    let steeps: Int
    let rating_hot: Int
    let rating_iced: Int
    let rating_coldbrew: Int
    let created_at: String

    var dryPhoto: Data? = nil
    var wetPhoto: Data? = nil
}
