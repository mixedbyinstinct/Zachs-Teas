//
//  RatingPickerView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/24/25.
//

import SwiftUI

struct RatingPickerView: View {
    @Binding var hot: Int
    @Binding var iced: Int
    @Binding var coldBrew: Int
    var onSelect: () -> Void

    let options: [(label: String, labelColor: Color, circleColor: Color)] = [
        ("Hot", TeaRating.hot.labelColor, TeaRating.hot.circleColor),
        ("Iced", TeaRating.iced.labelColor, TeaRating.iced.circleColor),
        ("Cold\nBrew", TeaRating.coldBrew.labelColor, TeaRating.coldBrew.circleColor)
    ]

    var body: some View {
        ZStack {
            Color(hex: "#A26D24").opacity(0.9)

            VStack(alignment: .leading) {
                ForEach(options.indices, id: \.self) { index in
                    let option = options[index]

                    HStack(alignment: .center, spacing: 2) {
                        Text(option.label)
                            .font(.custom("Buda-Light", size: 14))
                            .foregroundColor(option.labelColor)
                            .multilineTextAlignment(.leading)
                            .frame(width: 52, alignment: .leading)

                        ForEach(1...10, id: \.self) { number in
                            ZStack {
                                Circle()
                                    .fill(option.circleColor)
                                    .frame(width: 12, height: 12)
                                    .onTapGesture {
                                        switch index {
                                        case 0: hot = number
                                        case 1: iced = number
                                        case 2: coldBrew = number
                                        default: break
                                        }
                                        onSelect()
                                    }

                                Text(String(number))
                                    .font(.custom("Buda-Light", size: 10))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .frame(width: 212, height: 104)
        .cornerRadius(10)
    }
}

