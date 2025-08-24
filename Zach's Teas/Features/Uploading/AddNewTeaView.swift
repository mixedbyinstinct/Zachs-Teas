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
    @State private var yearFieldTapped = false
    @State private var steepsFieldTapped = false
    @State private var nameFieldTapped = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(hex: "#FB711C")
                .ignoresSafeArea()
                .allowsHitTesting(false)
            ScrollView {
                AddTeaForm(
                    viewModel: viewModel,
                    showSeasonMenu: $showSeasonMenu,
                    showRatingMenu: $showRatingMenu,
                    nameFieldTapped: $nameFieldTapped
                )
            }
        }
        
        .overlay(overlayViews)
        .hideKeyboardOnTap()
    }
    
    @ViewBuilder
    private var overlayViews: some View {
        if showSeasonMenu {
            SeasonPickerView(
                selectedSeason: $viewModel.season,
                onSelect: { showSeasonMenu = false }
            )
            .offset(x: 83, y: 137)
        }

        if showRatingMenu {
            RatingPickerView(
                hot: $viewModel.ratingHot,
                iced: $viewModel.ratingIced,
                coldBrew: $viewModel.ratingColdBrew,
                onSelect: { showRatingMenu = false }
            )
            .offset(x: 83, y: 220)
        }

        if viewModel.showSuccessToast {
            SuccessToastView()
        }

        if viewModel.showErrorToast {
            ErrorToastView(message: viewModel.uploadError!.localizedCapitalized)
        }
    }
}

private struct AddTeaForm: View {
    @ObservedObject var viewModel: AddTeaViewModel
    @Binding var showSeasonMenu: Bool
    @Binding var showRatingMenu: Bool
    @Binding var nameFieldTapped: Bool

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
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

            ZStack {
                Color(hex: "#EED160").opacity(0.51)
                TextField("Name", text: $viewModel.name)
                    .font(.custom("Buda-Light", size: 20))
                    .foregroundColor(Color(hex: "#832F2F"))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        if !nameFieldTapped {
                            viewModel.name = ""
                            nameFieldTapped = true
                        }
                    }
            }
            .frame(width: 319, height: 46)
            .cornerRadius(6)

            GenrePickerCard(selectedGenre: $viewModel.genre)

            MetadataFormView(
                year: $viewModel.yearText,
                steeps: $viewModel.steepsText,
                season: $viewModel.season,
                ratingHot: $viewModel.ratingHot,
                ratingIced: $viewModel.ratingIced,
                ratingColdBrew: $viewModel.ratingColdBrew,
                showSeasonMenu: $showSeasonMenu,
                showRatingMenu: $showRatingMenu
            )

            ZStack {
                Color(hex: "#EED160").opacity(0.51)
                VStack {
                    Text("Upload Photo")
                        .font(.custom("Buda-Light", size: 20))
                        .foregroundColor(Color(hex: "#832F2F"))
                    HStack {
                        PhotoUploadSlotView(label: "Dry", imageData: $viewModel.dryPhoto)
                        PhotoUploadSlotView(label: "Wet", imageData: $viewModel.wetPhoto)
                    }
                }
            }
            .frame(width: 319, height: 165)
            .cornerRadius(6)

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
    }
}


