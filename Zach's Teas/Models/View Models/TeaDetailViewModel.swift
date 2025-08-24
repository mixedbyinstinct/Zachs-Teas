//
//  TeaDetailViewModel.swift
//  Zach's Teas
//
//  Created by Zach Baron on 8/23/25.
//


import Foundation
import SwiftUI

@MainActor
class TeaDetailViewModel: ObservableObject {
    @Published var tea: TeaDetail?
    @Published var isLoading = true
    @Published var errorMessage: String?

    func fetchTeaDetail(id: UUID) async {
        do {
            let detailURL = URL(string: "http://10.0.0.46:3090/teas/detail/\(id)")!
            let (data, _) = try await URLSession.shared.data(from: detailURL)
            var tea = try JSONDecoder().decode(TeaDetail.self, from: data)

            // Load photos
            async let dryPhotoData = loadPhoto(for: id, type: "dry")
            async let wetPhotoData = loadPhoto(for: id, type: "wet")
            tea.dryPhoto = try await dryPhotoData
            tea.wetPhoto = try await wetPhotoData

            self.tea = tea
            self.isLoading = false
        } catch {
            self.errorMessage = error.localizedDescription
            self.isLoading = false
        }
    }

    private func loadPhoto(for id: UUID, type: String) async throws -> Data? {
        let url = URL(string: "http://10.0.0.46:3090/photo/\(id.uuidString)/\(type)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
