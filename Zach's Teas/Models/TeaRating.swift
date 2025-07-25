//
//  TeaRating.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/24/25.
//

import SwiftUI

enum TeaRating: String, CaseIterable, Identifiable {
    case hot = "Hot"
    case iced = "Iced"
    case coldBrew = "Cold Brew"
    
    var id: String { rawValue }
    
    var displayName: String {
        rawValue
    }
    
    var labelColor: Color {
        switch self {
        case .hot: return Color(hex:"#6B0303")
        case .iced: return Color(hex:"#140C86")
        case .coldBrew: return Color(hex:"#0C660C")
        }
    }
    
    var circleColor: Color {
        switch self {
        case .hot: return Color(hex:"#D22608")
        case .iced: return Color(hex:"#126CE0")
        case .coldBrew: return Color(hex:"#08D220")
        }
    }
}
