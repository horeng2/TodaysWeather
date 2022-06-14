//
//  ImageCacheManager.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/14.
//

import Foundation
import UIKit

class ImageCacheManager {
    private let cache = NSCache<NSString, UIImage>()
    static let shared = ImageCacheManager()
    
    private func loadCacheData(for key: String) -> UIImage? {
        let url = NSString(string: key)
        return self.cache.object(forKey: url as NSString )
    }
    
    private func saveCacheData(of image: UIImage, for key: String) {
        let url = NSString(string: key)
        self.cache.setObject(image, forKey: url)
    }
    
    func loadImage(
        url: String,
        completionHandler: @escaping (UIImage?) -> Void
    ) {
        guard let imageURL = URL(string: url) else {
            return
        }

        let task = URLSession.shared.dataTask(with: imageURL) { data, _, _ in
            guard let data = data else {
                completionHandler(nil)
                return
            }
            if let cachedImage = self.loadCacheData(for: url) {
                completionHandler(cachedImage)
            } else {
                let newImage = UIImage(data: data)
                self.saveCacheData(of: newImage ?? UIImage(), for: url)
                completionHandler(newImage)
            }
        }
        task.resume()
    }
}
