//
//  RatingPickerView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/24/25.
//

import SwiftUI

struct RatingPickerView: View {
    let options: [(label: String, labelColor: Color, circleColor: Color)] = [
        ("Hot", Color(hex:"#6B0303"), Color(hex:"#D22608")),
        ("Iced", Color(hex:"#140C86"), Color(hex:"#126CE0")),
        ("Cold\nBrew", Color(hex:"#0C660C"), Color(hex:"#08D220"))
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
                            .frame(width: 52, alignment: .leading) // fixed width for alignment
                        
                        ForEach(1...10, id: \.self) { number in
                            ZStack {
                                Circle()
                                    .fill(option.circleColor)
                                    .frame(width: 12, height: 12)
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

