//
//  TeaListView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//


import SwiftUI

struct TeaListView: View {
    let genre: TeaGenre

    var body: some View {
        ZStack {
            Color(hex: "#FB711C")
                .ignoresSafeArea()
            
            Text("Teas in \(genre.displayName)")
                .font(.custom("Amarante-Regular", size: 45))
                .navigationTitle(genre.displayName)
        }
    }
}
