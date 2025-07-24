//
//  AddNewTeaView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//

import SwiftUI

struct AddNewTeaView: View {
    @StateObject private var viewModel = AddTeaViewModel()

    var body: some View {
        ZStack {
            Color(hex: "#FB711C")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                // MARK: - Header
                
                HeaderView(
                    subtitle: "Add New Tea",
                    iconName: "tea_cup_icon",
                    iconOverlay: AnyView(
                        Text("+")
                            .font(.custom("Bokor-Regular", size: 96))
                            .foregroundColor(.black)
                    ),
                    subtitleFont: .custom("Asul-Bold", size: 48),
                    subtitleColor: Color(hex: "#EED160"),
                    strokedSubtitle: true,
                    subtitleStrokeColor: UIColor(hex: "#832F2F"),
                    subtitleStrokeWidth: -2,
                    strokedSubtitleFont: UIFont(name: "Asul-Bold", size: 48),
                    iconWidth: 159.85,
                    iconHeight: 124.35
                )

                // MARK: - Add tea form
                Text("TODO: Add New Tea Form")
                    .font(.custom("Amarante-Regular", size: 45))
                
                // MARK: - Upload button
                Button("Upload Tea") {
                    Task {
                        await viewModel.uploadTea()
                    }
                }
                .disabled(viewModel.isUploading)
                .padding()
                .background(Color(hex: "#FEC11B"))
                .foregroundColor(.black)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}

