//
//  SeasonPickerView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/24/25.
//

import SwiftUI

struct SeasonPickerView: View {
    let seasons: [TeaSeason] = TeaSeason.allCases
    @Binding var selectedSeason: String
    var onSelect: () -> Void

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ZStack {
            Color(hex: "#A26D24").opacity(0.9)

            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(seasons) { season in
                    Text(season.displayName)
                        .font(.custom("Buda-Light", size: 12))
                        .foregroundColor(season.color)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .onTapGesture {
                            selectedSeason = season.rawValue
                            onSelect()
                        }
                }
            }
        }
        .frame(width: 123, height: 56)
        .cornerRadius(10)
    }
}

