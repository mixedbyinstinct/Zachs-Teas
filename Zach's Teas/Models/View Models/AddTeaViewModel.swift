//
//  AddTeaViewModel.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/24/25.
//


import Foundation
import SwiftUI

@MainActor
class AddTeaViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var genre: String = ""
    @Published var season: String = ""
    @Published var ratingHot: Int = 0
    @Published var ratingIced: Int = 0
    @Published var ratingColdBrew: Int = 0
    @Published var dryPhoto: Data?
    @Published var wetPhoto: Data?

    @Published var isUploading = false
    @Published var uploadError: String?
    @Published var showSuccessToast: Bool = false
    @Published var showErrorToast: Bool = false
    
    @Published var yearText: String = ""
    @Published var steepsText: String = ""

    var year: Int {
        Int(yearText) ?? 0
    }

    var steeps: Int {
        Int(steepsText) ?? 0
    }


    func uploadTea() async {
        isUploading = true
        uploadError = nil

        let metadata = NewTea(
            name: name,
            genre: genre,
            year: year,
            season: season,
            steeps: steeps,
            rating_hot: ratingHot,
            rating_iced: ratingIced,
            rating_coldbrew: ratingColdBrew
        )

        do {
            guard let teaID = try await postTea(metadata: metadata) else {
                throw UploadError.metadataFailed
            }

            if let dry = dryPhoto {
                try await uploadPhoto(teaID: teaID, type: "dry", data: dry)
            }

            if let wet = wetPhoto {
                try await uploadPhoto(teaID: teaID, type: "wet", data: wet)
            }

            isUploading = false
            showSuccessToast = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.showSuccessToast = false
            }
        } catch {
            uploadError = error.localizedDescription
            isUploading = false
            showErrorToast = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                self.showErrorToast = false
            }
        }
    }

    private func postTea(metadata: NewTea) async throws -> UUID? {
        let url = URL(string: "http://10.0.0.46:3090/teas")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(metadata)

        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(UUID.self, from: data)
    }

    private func uploadPhoto(teaID: UUID, type: String, data: Data) async throws {
        let url = URL(string: "http://10.0.0.46:3090/upload-photo/\(teaID.uuidString)/\(type)")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.timeoutInterval = 120  // Increased timeout for larger uploads

        let boundary = UUID().uuidString
        let filename = "\(type).jpg"
        let fieldName = "file"
        let mimeType = "image/jpeg"

        // Build multipart body
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
        body.append(data)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        // Log size for debugging
        print("📸 Uploading photo '\(type)' (\(data.count) bytes)")

        // Set headers
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.setValue("\(body.count)", forHTTPHeaderField: "Content-Length")

        request.httpBody = body

        let (_, response) = try await URLSession.shared.data(for: request)

        if let httpResponse = response as? HTTPURLResponse {
            print("📶 Photo upload response: \(httpResponse.statusCode)")
        }
    }


    enum UploadError: Error {
        case metadataFailed
    }
}
