//
//  ErrorToastView.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/27/25.
//

import SwiftUI

struct ErrorToastView: View {
    let message: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.8)
            
            Text("⛔️ UPLOAD ERROR: \(message) ⛔️")
                .font(.custom("Amarante-Regular", size: 16))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 350, height: 50)
        .cornerRadius(10)
    }
}
