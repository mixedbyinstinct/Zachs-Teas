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
    @State private var newTeaIsBold: Bool = false
    @State private var newTeaFont: UIFont = UIFont(name: "Asul-Regular", size: 45)!
    @State private var newTeaIsStroked: Bool = false
    @State private var newTeaStrokeColor: Color = .black
    @State private var buttonStroked: Bool = false
    @State private var buttonBackgroundColor: Color = .black
    @State private var buttonTextColor: Color = .black
    @State private var buttonStrokeColor: Color = .white
    
    @StateObject private var viewModel = TeaListViewModel()
    
    var body: some View {
        ZStack {
            Color(hex: "#FB711C")
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    HeaderView(
                        iconName: "tea_cup_icon",
                        iconOverlay: AnyView(getIconOverlay()),
                        iconWidth: iconWidth,
                        iconHeight: iconHeight
                    )
                    
                    NavigationLink(destination: SteepsView()) {
                        if buttonStroked {
                            StrokedText(
                                text: "Number of Steeps",
                                font: UIFont(name: "Belleza-Regular", size: 40)!,
                                strokeColor: UIColor(buttonStrokeColor),
                                foregroundColor: UIColor(buttonTextColor),
                                strokeWidth: -2
                            )
                            .frame(width: 308, height: 63)
                            .background(buttonBackgroundColor)
                            .cornerRadius(13)
                        } else {
                            Text("Number of Steeps")
                                .font(.custom("Belleza-Regular", size: 40))
                                .foregroundColor(buttonTextColor)
                                .frame(width: 308, height: 63)
                                .background(buttonBackgroundColor)
                                .cornerRadius(13)
                        }
                    }
                    
                    if viewModel.isLoading {
                        ProgressView()
                    } else if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                    } else {
                        VStack(alignment: .center, spacing: 16) {
                            ForEach(viewModel.teas) { tea in
                                Text(tea.name)
                                    .font(.custom("Asul-Regular", size: 26))
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 8) {
                                    Text("\(tea.rating_hot ?? 0)")
                                        .font(.custom("Amarante-Regular", size: 16))
                                        .foregroundColor(Color(hex: "#6B0303"))
                                    
                                    Text("\(tea.rating_iced ?? 0)")
                                        .font(.custom("Amarante-Regular", size: 16))
                                        .foregroundColor(Color(hex: "#140C86"))
                                    
                                    Text("\(tea.rating_coldbrew ?? 0)")
                                        .font(.custom("Amarante-Regular", size: 16))
                                        .foregroundColor(Color(hex: "#0C660C"))
                                }
                            }
                            
                            NavigationLink(destination: AddNewTeaView()) {
                                if newTeaIsStroked {
                                    StrokedText(
                                        text: "+ New Tea",
                                        font: newTeaFont,
                                        strokeColor: UIColor(newTeaStrokeColor),
                                        foregroundColor: UIColor(genre.color),
                                        strokeWidth: -2
                                    )
                                    .frame(width: 253, height: 72)
                                    .cornerRadius(15)
                                } else {
                                    Text("+ New Tea")
                                        .font(Font(newTeaFont))
                                        .foregroundColor(genre.color)
                                        .frame(width: 253, height: 72)
                                        .cornerRadius(15)
                                }
                            }
                            
                            Spacer() // pushes content up
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                        .padding(.top, 8) // tweak spacing below the cup
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchTeas(for: genre.id)
            }
            if genre == .white {
                stroked = true
            }
            setButtonColors()
            getIconSize()
            updateFont()
            
        }
    }

    // MARK: - Overlay logic
    @ViewBuilder
    private func getIconOverlay() -> some View {
        let maxTextWidth = iconWidth * 0.95

        if genre == .fermented {
            VStack(spacing: -6) {
                Text("Fermented")
                    .font(.custom("Amarante-Regular", size: fontSize))
                    .foregroundColor(genre.color)
                Text("(Hei Cha)")
                    .font(.custom("Amarante-Regular", size: fontSize))
                    .foregroundColor(genre.color)
            }
            .frame(width: maxTextWidth)
            .multilineTextAlignment(.center)
            .offset(y: -2)
            .padding()
        } else if stroked {
            StrokedText(
                text: genre.displayName,
                font: UIFont(name: "Amarante-Regular", size: fontSize)!,
                strokeColor: UIColor(hex: "#858911"),
                foregroundColor: .white,
                strokeWidth: -2
            )
            .frame(maxWidth: maxTextWidth)
            .multilineTextAlignment(.center)
            .offset(y: -2)
        } else {
            Text(genre.displayName)
                .font(.custom("Amarante-Regular", size: fontSize))
                .foregroundColor(genre.color)
                .frame(maxWidth: maxTextWidth)
                .multilineTextAlignment(.center)
                .offset(y: -2)
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
    
    // MARK: - Font logic
    private func updateFont() {
        if genre == .white || genre == .puErh {
            newTeaIsBold = true
        }
        let font = newTeaIsBold ? UIFont(name: "Asul-Bold", size: 45) : UIFont(name: "Asul-Regular", size: 45)
        newTeaFont = font!
    }
    
    // MARK: - Color logic
    private func setButtonColors() {
        switch genre {
        case .white:
            newTeaIsStroked = true
            newTeaStrokeColor = Color(hex: "#858911")
            buttonBackgroundColor = Color(hex: "#E9D9D9")
            buttonStroked = true
            buttonStrokeColor = Color(hex: "#FFFBFB")
            buttonTextColor = Color(hex: "#858911")
        case .green:
            newTeaIsStroked = true
            newTeaStrokeColor = Color(hex: "#228709")
            buttonBackgroundColor = Color(hex: "#BEE95A")
            buttonStroked = true
            buttonStrokeColor = Color(hex: "#228709")
            buttonTextColor = Color(hex: "#93CD82")
        case .oolong:
            newTeaIsStroked = true
            newTeaStrokeColor = Color(hex: "#B94E4E")
            buttonBackgroundColor = Color(hex: "#B36060")
            buttonTextColor = Color(hex: "#832F2F")
        case .yellow:
            newTeaIsStroked = true
            newTeaStrokeColor = Color(hex: "#F4C712")
            buttonBackgroundColor = Color(hex: "#FFCE09")
            buttonStroked = true
            buttonStrokeColor = Color(hex: "#A8880A")
            buttonTextColor = Color(hex: "#FBED4B")
        case .puErh:
            newTeaIsStroked = true
            newTeaStrokeColor = Color(hex: "#436171")
            buttonBackgroundColor = Color(hex: "#436171")
            buttonStroked = true
            buttonStrokeColor = Color(hex: "#A97C7C")
            buttonTextColor = Color(hex: "#946DCC")
        case .black:
            buttonBackgroundColor = Color(hex: "#1E0F55")
            buttonTextColor = .black
        case .fermented:
            buttonBackgroundColor = Color(hex: "#D31D1D")
            buttonTextColor = Color(hex: "#6E3333")
        }
    }
}

