//
//  TeaListView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//


import SwiftUI

struct TeaListView: View {
    let genre: TeaGenre
    @State private var stroked: Bool = false
    @State private var iconWidth: CGFloat = 198.17
    @State private var iconHeight: CGFloat = 143.05
    @State private var fontSize: CGFloat = 48
    @StateObject private var viewModel = TeaListViewModel()

    var body: some View {
        ZStack {
            Color(hex: "#FB711C")
                .ignoresSafeArea()
            
            VStack {
                HeaderView(
                    iconName: "tea_cup_icon",
                    iconOverlay: getIconOverlay(),
                    iconWidth: iconWidth,
                    iconHeight: iconHeight
                )
                
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    VStack {
                        ForEach(viewModel.teas) { tea in
                            //VStack {
                                Text(tea.name)
                                    .font(.custom("Amarante-Bold", size: 26))
                                    .foregroundColor(.white)

                                if let rating = tea.rating_hot {
                                    Text("\(rating)/10")
                                        .font(.custom("Amarante-Regular", size: 16))
                                        .foregroundColor(.white)
                                }
                            //}
                        }

                        Text("+ New Tea")
                            .font(.custom("Amarante-Bold", size: 24))
                            .foregroundColor(.white)
                            .shadow(color: Color(hex: "#85C226"), radius: 0, x: 1, y: 1)
                    }
                }

               /* Text("Teas in \(genre.displayName)")
                    .font(.custom("Amarante-Regular", size: 45))
                    .navigationTitle(genre.displayName)*/
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchTeas(for: genre.rawValue)
            }
            if genre == .white {
                stroked = true
            }
            getIconSize()
        }
    }

    // MARK: - Overlay logic
    private func getIconOverlay() -> AnyView {
        let maxTextWidth = iconWidth * 0.95

        if genre == .fermented {
            let firstLine = "Fermented"
            let secondLine = "(Hei Cha)"

            return AnyView(
                VStack(spacing: -6) {
                        Text(firstLine)
                            .font(.custom("Amarante-Regular", size: fontSize))
                            .foregroundColor(genre.color)
                        Text(secondLine)
                            .font(.custom("Amarante-Regular", size: fontSize))
                            .foregroundColor(genre.color)
                }
                .frame(width: maxTextWidth)
                .multilineTextAlignment(.center)
                .offset(y: -2)
                .padding()
            )
        } else {
            return AnyView(
                (stroked ?
                    AnyView(
                        StrokedText(
                            text: genre.displayName,
                            font: UIFont(name: "Amarante-Regular", size: fontSize)!,
                            strokeColor: UIColor(hex: "#858911"),
                            foregroundColor: .white,
                            strokeWidth: -2
                        )
                    ) :
                    AnyView(
                        Text(genre.displayName)
                            .font(.custom("Amarante-Regular", size: fontSize))
                            .foregroundColor(genre.color)
                    )
                )
                .frame(maxWidth: maxTextWidth)
                .multilineTextAlignment(.center)
                .offset(y: -2)
            )
        }
    }
    
    // MARK: - Size logic
    private func getIconSize() {
        if genre == .fermented {
            iconWidth = 224.27
            iconHeight = 158.48
            fontSize = 38
        }
    }
}

