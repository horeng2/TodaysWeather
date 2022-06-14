//
//  UIImageView+Extension.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/13.
//

import UIKit

extension UIImageView {
    func loadImage(iconCode: String?) {
        guard let iconCode =  iconCode else {
            return
        }
        let urlString = "http://openweathermap.org/img/wn/\(iconCode)@2x.png"
        
        guard let imageURL = URL(string: urlString) else {
            return
        }
        let iconCache = NSCache<NSString, UIImage>()
        
        let task = URLSession.shared.dataTask(with: imageURL) { data, _, _ in
            guard let data = data else {
                return
            }
            if let iconCacheImage = iconCache.object(forKey: iconCode as NSString) {
                self.image = iconCacheImage
            } else {
                let newImage = UIImage(data: data)
                iconCache.setObject(newImage ?? UIImage(), forKey: iconCode as NSString)
                DispatchQueue.main.async {
                    self.image = newImage
                }
            }
        }
        task.resume()
    }
}
