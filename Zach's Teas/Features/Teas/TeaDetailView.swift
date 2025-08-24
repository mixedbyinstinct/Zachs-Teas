//
//  TeaDetailView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 8/23/25.
//


import SwiftUI

struct TeaDetailView: View {
    let teaID: UUID
    let genre: TeaGenre

    @StateObject private var viewModel = TeaDetailViewModel()

    var body: some View {
        ZStack {
            Color(hex: "#FB711C").ignoresSafeArea()
            if viewModel.isLoading {
                ProgressView()
            } else if let tea = viewModel.tea {
                VStack(spacing: 12) {
                    HeaderView(
                        title: tea.name,
                        subtitle: "\(tea.season) \(tea.year)  –  \(genre.displayName) Tea",
                        iconName: "tea_detail_icon",
                        iconTint: genre.color,
                        titleFont: .custom("Amarante-Regular", size: 42),
                        subtitleFont: .custom("Cantarell-Bold", size: 18),
                        titleColor: .yellow,
                        subtitleColor: .white
                    )

                    // Photos
                    HStack(spacing: 32) {
                        TeaPhotoBox(imageData: tea.dryPhoto, label: "Dry Leaves")
                        TeaPhotoBox(imageData: tea.wetPhoto, label: "Wet Leaves")
                    }

                    // Steeps
                    Text("\(tea.steeps) Steeps")
                        .font(.custom("Cantarell-Regular", size: 18))
                        .foregroundColor(.white)
                        .padding(.top, 16)

                    // Ratings
                    HStack(spacing: 24) {
                        VStack {
                            Text("Hot:")
                                .font(.custom("Amarante-Regular", size: 18))
                                .foregroundColor(Color(hex: "#6B0303"))
                            Text("\(tea.rating_hot)/10")
                                .font(.custom("Cantarell-Bold", size: 18))
                        }

                        VStack {
                            Text("Iced:")
                                .font(.custom("Amarante-Regular", size: 18))
                                .foregroundColor(Color(hex: "#140C86"))
                            Text("\(tea.rating_iced)/10")
                                .font(.custom("Cantarell-Bold", size: 18))
                        }

                        VStack {
                            Text("Cold Brew:")
                                .font(.custom("Amarante-Regular", size: 18))
                                .foregroundColor(Color(hex: "#0C660C"))
                            Text("\(tea.rating_coldbrew)/10")
                                .font(.custom("Cantarell-Bold", size: 18))
                        }
                    }

                    Spacer()
                }
                .padding()
            } else {
                Text(viewModel.errorMessage ?? "Unknown error")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchTeaDetail(id: teaID)
            }
        }
    }
}
