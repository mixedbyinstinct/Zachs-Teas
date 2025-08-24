//
//  PhotoPicker.swift
//  Zach's Teas
//
//  Created by Zach Baron on 7/27/25.
//


import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var imageData: Data?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let itemProvider = results.first?.itemProvider,
                  itemProvider.canLoadObject(ofClass: UIImage.self) else { return }

            itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                if let uiImage = image as? UIImage,
                   let data = uiImage.jpegData(compressionQuality: 0.9) {
                    DispatchQueue.main.async {
                        self.parent.imageData = data
                    }
                }
            }
        }
    }
}
