//
//  GenreListView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//


import SwiftUI

struct GenreListView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let genres: [TeaGenre] = TeaGenre.allCases.filter { $0 != .fermented }
    let finalGenre: TeaGenre = .fermented
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#FB711C")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    HeaderView(
                        title: "Zach's Teas",
                        iconName: "tea_cup_icon",
                        titleFont: .custom("Amarante-Regular", size: 45),
                        titleColor: Color(hex: "#EED160")
                    )
                    
                    
                    NavigationLink(destination: AddNewTeaView()) {
                        Text("+ New Tea")
                            .font(.custom("Brygada1918-SemiBold", size: 36))
                            .foregroundColor(Color(hex: "#BF1079"))
                            .frame(width: 253, height: 72) // 👈 frame applied here
                            .background(Color(hex: "#EED160").opacity(0.51))
                            .cornerRadius(15)
                    }

                    
                    StrokedText(
                        text: "Genre",
                        font: UIFont(name: "Amarante-Regular", size: 45)!,
                        strokeColor: UIColor.black,
                        foregroundColor: UIColor(hex: "#EF9C61"),
                        strokeWidth: -2  // negative = stroke + fill
                    )
                    .frame(height: 50)

                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(genres) { genre in
                            NavigationLink(destination: TeaListView(genre: genre)) {
                                Text(genre.displayName)
                                    .font(.custom("Amarante-Regular", size: 32))
                                    .foregroundColor(genre.color)
                            }
                        }
                    }

                    // Final centered row
                    NavigationLink(destination: TeaListView(genre: finalGenre)) {
                        Text(finalGenre.displayName)
                            .font(.custom("Amarante-Regular", size: 32))
                            .foregroundColor(finalGenre.color)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
    }
}
