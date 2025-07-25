//
//  AddNewTeaView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//

import SwiftUI

struct AddNewTeaView: View {
    @StateObject private var viewModel = AddTeaViewModel()
    @State private var showSeasonMenu: Bool = false
    @State private var showRatingMenu: Bool = false
    @Environment(\.dismiss) private var dismiss

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

                // MARK: - Name Card
                ZStack {
                    Color(hex: "#EED16082").opacity(0.51)
                    VStack {
                        Text("Name")
                            .font(.custom("Buda-Light", size: 20))
                            .foregroundColor(Color(hex:"#832F2FA6").opacity(0.65))
                    }
                }
                .frame(width: 319, height: 46)
                .cornerRadius(6)
                
                // MARK: - Genre Selector Card
                ZStack {
                    Color(hex: "#EED16082").opacity(0.51)
                    VStack {
                        Text("Genre")
                            .font(.custom("Buda-Light", size: 20))
                            .foregroundColor(Color(hex: "#832F2FA6").opacity(0.65))
                            .frame(maxWidth: .infinity)
                        VStack(spacing: 10) {
                            HStack(spacing: 20) {
                                Text("White")
                                    .font(.custom("Amarante-Regular", size: 16))
                                    .foregroundColor(TeaGenre.white.color)
                                Text("Black")
                                    .font(.custom("Amarante-Regular", size: 16))
                                    .foregroundColor(TeaGenre.black.color)
                                Text("Oolong")
                                    .font(.custom("Amarante-Regular", size: 16))
                                    .foregroundColor(TeaGenre.oolong.color)
                                Text("Green")
                                    .font(.custom("Amarante-Regular", size: 16))
                                    .foregroundColor(TeaGenre.green.color)
                            }
                            HStack(spacing: 20) {
                                Text("Pu'Erh")
                                    .font(.custom("Amarante-Regular", size: 16))
                                    .foregroundColor(TeaGenre.puErh.color)
                                Text("Yellow")
                                    .font(.custom("Amarante-Regular", size: 16))
                                    .foregroundColor(TeaGenre.yellow.color)
                                Text("Fermented(Hei Cha)")
                                    .font(.custom("Amarante-Regular", size: 16))
                                    .foregroundColor(TeaGenre.fermented.color)
                            }
                        }
                    }
                }
                .frame(width: 317, height: 94)
                .cornerRadius(10)
                .shadow(color: Color(hex: "#D31D1D").opacity(0.3), radius: 4, x: 4, y: 4)
                
                // MARK: - Metadata form
                VStack(spacing: 10) {
                    HStack(spacing: 20) {
                        ZStack {
                            Color(hex: "#EED16082").opacity(0.51)
                            Text("Year")
                                .font(.custom("Buda-Light", size: 20))
                                .foregroundColor(Color(hex:"#832F2FA6").opacity(0.65))
                        }
                        .frame(width:138, height: 46)
                        .cornerRadius(6)
                        .shadow(color: Color(hex: "#D31D1D").opacity(0.3), radius: 4, x: 4, y: 4)
                        ZStack {
                            Color(hex: "#EED16082").opacity(0.51)
                            Button(action: {
                                showSeasonMenu = !showSeasonMenu
                            }) {
                                Text("Season")
                                    .font(.custom("Buda-Light", size: 20))
                                    .foregroundColor(Color(hex:"#832F2FA6").opacity(0.65))
                            }
                        }
                        .frame(width: 176, height: 46)
                        .cornerRadius(6)
                        .shadow(color: Color(hex: "#D31D1D").opacity(0.3), radius: 4, x: 4, y: 4)
                    }
                    HStack(spacing: 20) {
                        ZStack {
                            Color(hex: "#EED16082").opacity(0.51)
                            Text("# of Steeps")
                                .font(.custom("Buda-Light", size: 20))
                                .foregroundColor(Color(hex:"#832F2FA6").opacity(0.65))
                        }
                        .frame(width:138, height: 46)
                        .cornerRadius(6)
                        .shadow(color: Color(hex: "#D31D1D").opacity(0.3), radius: 4, x: 4, y: 4)
                        ZStack {
                            Color(hex: "#EED16082").opacity(0.51)
                            Button(action: {
                                showRatingMenu = !showRatingMenu
                            }) {
                                Text("Rating")
                                    .font(.custom("Buda-Light", size: 20))
                                    .foregroundColor(Color(hex:"#832F2FA6").opacity(0.65))
                            }
                        }
                        .frame(width: 176, height: 46)
                        .cornerRadius(6)
                        .shadow(color: Color(hex: "#D31D1D").opacity(0.3), radius: 4, x: 4, y: 4)
                    }
                    .padding(.top, 12)
                }
                // MARK: - Upload button
                Button(action: {
                    Task {
                        await viewModel.uploadTea()
                    }
                }) {
                    ZStack {
                        Color(hex: "#FAA70C")
                        Text("Upload Tea")
                            .font(.custom("Asul-Bold", size: 24))
                            .foregroundColor(Color(hex: "##423227"))
                    }
                    .frame(width: 308, height: 57)
                    .cornerRadius(15)
                }
                
                // MARK: - Cancel Button
                Button(action: { dismiss() }) {
                    ZStack {
                        Color(hex: "#E5FCFF")
                        Text("Cancel")
                            .font(.custom("Asul-Bold", size: 24))
                            .foregroundColor(Color(hex: "#DD2B13"))
                    }
                    .frame(width: 242, height: 54)
                    .cornerRadius(10)
                }
            }
            
            // MARK: - Pickers
            if showSeasonMenu {
                SeasonPickerView()
                    .offset(x: 83, y: 142)
            }
            
            if showRatingMenu {
                RatingPickerView()
                    .offset(x: 83, y: 240)
            }
        }
    }
}

