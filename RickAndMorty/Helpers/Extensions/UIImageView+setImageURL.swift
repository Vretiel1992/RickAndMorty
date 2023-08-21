//
//  UIImageView+setImageURL.swift
//  RickAndMorty
//
//  Created by Антон Денисюк on 21.08.2023.
//

import UIKit

extension UIImageView {

    private func loadImage(_ url: URL, placeholder: UIImage? = nil, _ completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data, let image = UIImage(data: data) else {
                completion(placeholder)
                return
            }
            completion(image)
        }.resume()
    }

    func setImageURL(_ url: URL, placeholder: UIImage? = nil) {
        tag = url.hashValue
        loadImage(url, placeholder: placeholder) { [weak self] image in
            guard let self = self else { return }

            DispatchQueue.main.async {
                guard self.tag == url.hashValue else { return }

                self.image = image
            }
        }
    }
}
