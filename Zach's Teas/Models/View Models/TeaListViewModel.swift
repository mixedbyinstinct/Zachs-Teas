//
//  TeaListViewModel.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/22/25.
//


import Foundation

@MainActor
class TeaListViewModel: ObservableObject {
    @Published var teas: [Tea] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchTeas(for genre: String) async {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "http://10.0.0.46:3090/teas/\(genre)") else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let teas = try JSONDecoder().decode([Tea].self, from: data)
            self.teas = teas
        } catch {
            errorMessage = "Failed to load teas: \(error.localizedDescription)"
        }

        isLoading = false
    }
}
