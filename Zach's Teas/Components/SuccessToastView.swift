//
//  SuccessToastView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/25/25.
//

import SwiftUI

struct SuccessToastView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            
            Text("🍵 Upload Successful 🍵")
                .font(.custom("Amarante-Regular", size: 32))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 350, height: 50)
        .cornerRadius(10)
    }
}
