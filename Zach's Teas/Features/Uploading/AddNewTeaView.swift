//
//  AddNewTeaView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//

import SwiftUI

struct AddNewTeaView: View {
    var body: some View {
        ZStack {
            Color(hex: "#FB711C")
                .ignoresSafeArea()
            VStack {
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


                Text("TODO: Add New Tea Form")
                    .font(.custom("Amarante-Regular", size: 45))
            }
        }
    }
}
