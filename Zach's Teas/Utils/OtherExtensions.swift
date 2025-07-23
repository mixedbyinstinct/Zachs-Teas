//
//  OtherExtensions.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//
import SwiftUI

extension View {
    @ViewBuilder
    func ifLet<T, V: View>(_ value: T?, transform: (Self, T) -> V) -> some View {
        if let value = value {
            transform(self, value)
        } else {
            self
        }
    }
}
