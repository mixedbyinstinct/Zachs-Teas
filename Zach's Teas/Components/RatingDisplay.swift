//
//  RatingDisplay.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/25/25.
//
import SwiftUI

struct RatingDisplay: View {
    //let label: String
    let value: Int
    let rating: TeaRating

    var body: some View {
        VStack(spacing: 0) {
            /*Text(label)
                .font(.custom("Buda-Light", size: 13))
                .foregroundColor(rating.labelColor)*/
            if value != 0 {
                Text("\(value)")
                    .font(.custom("Buda-Light", size: 15))
                    .foregroundColor(rating.labelColor)
            } else {
                Text("𝜭")
                    .font(.custom("Buda-Light", size: 15))
                    .foregroundColor(rating.labelColor)
            }
        }
    }
}
