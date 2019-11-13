//
//  UIImage+Extension.swift
//  CountriesApp
//
//  Created by Cesar Armando on 11/12/19.
//  Copyright © 2019 Cesar Armando. All rights reserved.
//

import UIKit
import SVGKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = SVGKImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image.uiImage
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
