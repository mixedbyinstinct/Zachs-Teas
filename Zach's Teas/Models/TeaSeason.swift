//
//  TeaSeason.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/24/25.
//

import SwiftUI

enum TeaSeason: String, Identifiable, CaseIterable {
    case winter = "Winter"
    case spring = "Spring"
    case summer = "Summer"
    case fall = "Fall"
    
    var id: String { rawValue }

    var displayName: String {
        rawValue
    }
    
    var color: Color {
        switch self {
        case .winter: return Color(hex: "#FFF9F9")
        case .spring: return Color(hex: "#3EC715")
        case .summer: return Color(hex: "#AD19A3")
        case .fall: return Color(hex: "#502912")
        }
    }
}
