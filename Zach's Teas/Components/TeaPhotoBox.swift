//
//  TeaPhotoBox.swift
//  Zach's Teas
//
//  Created by Zach Baron on 8/23/25.
//
import SwiftUI

struct TeaPhotoBox: View {
    var imageData: Data?
    var label: String

    var body: some View {
        VStack(spacing: 4) {
            if let data = imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 150)
                    .clipped()
                    .cornerRadius(8)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 120, height: 150)
                    .cornerRadius(8)
            }

            Text(label)
                .font(.custom("Cantarell-Regular", size: 13))
                .foregroundColor(.gray)
        }
    }
}
