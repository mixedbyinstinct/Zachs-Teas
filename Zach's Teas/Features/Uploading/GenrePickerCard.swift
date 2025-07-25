//
//  GenrePickerCard.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/25/25.
//


import SwiftUI

struct GenrePickerCard: View {
    @Binding var selectedGenre: String

    var body: some View {
        ZStack {
            Color(hex: "#EED160").opacity(0.51)

            VStack(spacing: 10) {
                Button(action: { selectedGenre = "" }) {
                    Text("Genre")
                        .font(.custom("Buda-Light", size: 20))
                        .foregroundColor(Color(hex: "#832F2FA6").opacity(0.65))
                        .frame(maxWidth: .infinity)
                }

                if let genre = TeaGenre(rawValue: selectedGenre), !selectedGenre.isEmpty {
                    Text(genre.rawValue)
                        .font(.custom("Amarante-Regular", size: 20))
                        .foregroundColor(genre.color)
                        .padding(.top, 6)
                } else {
                    VStack(spacing: 10) {
                        HStack(spacing: 20) {
                            ForEach([TeaGenre.white, .black, .oolong, .green], id: \.self) { genre in
                                Text(genre.rawValue)
                                    .font(.custom("Amarante-Regular", size: 16))
                                    .foregroundColor(genre.color)
                                    .onTapGesture {
                                        selectedGenre = genre.rawValue
                                    }
                            }
                        }

                        HStack(spacing: 20) {
                            ForEach([TeaGenre.puErh, .yellow, .fermented], id: \.self) { genre in
                                Text(genre.rawValue)
                                    .font(.custom("Amarante-Regular", size: 16))
                                    .foregroundColor(genre.color)
                                    .onTapGesture {
                                        selectedGenre = genre.rawValue
                                    }
                            }
                        }
                    }
                }
            }
        }
        .frame(width: 317, height: 94)
        .cornerRadius(10)
        .shadow(color: Color(hex: "#D31D1D").opacity(0.3), radius: 4, x: 4, y: 4)
    }
}
