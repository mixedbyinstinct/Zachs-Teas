//
//  NewTea.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/24/25.
//


import Foundation

struct NewTea: Codable {
    var name: String
    var genre: String
    var year: Int
    var season: String
    var steeps: Int
    var rating_hot: Int
    var rating_iced: Int
    var rating_coldbrew: Int
}
