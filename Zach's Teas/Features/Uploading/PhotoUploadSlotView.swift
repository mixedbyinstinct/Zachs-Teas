//
//  PhotoUploadSlotView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/25/25.
//
import SwiftUI

struct PhotoUploadSlotView: View {
    let label: String

    var body: some View {
        ZStack {
           // Color(hex: "#EED160").opacity(0.3)

            Text("+\(label)")
                .font(.custom("Buda-Light", size: 20))
                .foregroundColor(Color(hex: "#A25424"))
        }
        .frame(width: 112, height: 116)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(style: StrokeStyle(lineWidth: 1.2, dash: [6]))
                .foregroundColor(Color(hex: "#B94E4E"))
        )
        .cornerRadius(8)
    }
}
