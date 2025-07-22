//
//  TeaGenre.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//


import SwiftUI

enum TeaGenre: String, CaseIterable, Identifiable {
    case white = "White"
    case black = "Black"
    case oolong = "Oolong"
    case green = "Green"
    case puErh = "Pu-erh"
    case yellow = "Yellow"
    case fermented = "Fermented(Hei Cha)"

    var id: String { rawValue }

    var displayName: String {
        rawValue
    }

    var color: Color {
        switch self {
        case .white: return .white
        case .black: return .black
        case .oolong: return Color(hex: "#B94E4E") // light brown
        case .green: return Color(hex: "#93CD82")
        case .puErh: return Color(hex: "#946DCC")
        case .yellow: return Color(hex: "#FBED4B")
        case .fermented: return Color(hex: "#6E3333")
        }
    }
}

