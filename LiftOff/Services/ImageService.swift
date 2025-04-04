//
//  ImageService.swift
//  LiftOff
//
//  Created by Meinecke, Alexander on 03.04.25.
//


// GENERATED!!

import UIKit

class ImageLoaderService {
    static let shared = ImageLoaderService()
    private let cache = NSCache<NSURL, UIImage>()

    private init() {}

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }


        if let cachedImage = cache.object(forKey: url as NSURL) {
            completion(cachedImage)
            return
        }


        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.cache.setObject(image, forKey: url as NSURL)
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }.resume()
    }
}
