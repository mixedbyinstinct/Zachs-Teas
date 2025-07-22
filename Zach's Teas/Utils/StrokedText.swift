//
//  StrokedText.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//


import SwiftUI

struct StrokedText: UIViewRepresentable {
    let text: String
    let font: UIFont
    let strokeColor: UIColor
    let foregroundColor: UIColor
    let strokeWidth: CGFloat  // positive = stroke only, negative = stroke + fill

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.attributedText = getAttributedString()
        label.textAlignment = .center
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.attributedText = getAttributedString()
    }

    private func getAttributedString() -> NSAttributedString {
        let attributes: [NSAttributedString.Key: Any] = [
            .strokeColor: strokeColor,
            .foregroundColor: foregroundColor,
            .strokeWidth: strokeWidth,
            .font: font
        ]

        return NSAttributedString(string: text, attributes: attributes)
    }
}
