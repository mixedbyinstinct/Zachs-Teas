//
//  PhotoUploadSlotView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/25/25.
//
import SwiftUI

struct PhotoUploadSlotView: View {
    let label: String
    @Binding var imageData: Data?
    @State private var showImagePicker = false

    var body: some View {
        ZStack {
            if let data = imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 112, height: 116)
                    .clipped()
                    .cornerRadius(8)
            } else {
                Text("+\(label)")
                    .font(.custom("Buda-Light", size: 20))
                    .foregroundColor(Color(hex: "#A25424"))
            }
        }
        .frame(width: 112, height: 116)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(style: StrokeStyle(lineWidth: 1.2, dash: [6]))
                .foregroundColor(Color(hex: "#B94E4E"))
        )
        .cornerRadius(8)
        .onTapGesture {
            showImagePicker = true
        }
        .sheet(isPresented: $showImagePicker) {
            PhotoPicker(imageData: $imageData)
        }
    }
}
