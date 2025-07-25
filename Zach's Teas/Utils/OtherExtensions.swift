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

extension Binding where Value == Int {
    func asString() -> Binding<String> {
        Binding<String>(
            get: { String(self.wrappedValue) },
            set: {
                if let intVal = Int($0) {
                    self.wrappedValue = intVal
                }
            }
        )
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            if shouldShow {
                placeholder()
            }
            self
        }
    }
}

extension View {
    func hideKeyboardOnTap() -> some View {
        self.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

