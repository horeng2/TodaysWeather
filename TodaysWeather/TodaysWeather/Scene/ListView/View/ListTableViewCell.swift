//
//  ListTableViewCell.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/12.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var totalInfoStackView: UIStackView!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherInfoStackView: UIStackView!
    @IBOutlet weak var temperatureLable: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    
    func configure(weatherInfo: WeatherInfo) {
        guard let iconCode = weatherInfo.weatherBasicsInfo.first?.icon else {
            return
        }
        let urlString = "http://openweathermap.org/img/wn/\(iconCode)@2x.png"
        self.weatherIconImageView.loadImage(url: urlString)
        self.cityNameLabel.text = weatherInfo.cityName
        self.temperatureLable.text = "현재기온: \(weatherInfo.weatherCondition.currentTemperatures)"
        self.humidityLabel.text = "현재습도: \(weatherInfo.weatherCondition.currentHumidity)"
    }
}

extension UIImageView {
    func loadImage(url: String) {
        var iconImage: UIImage?
        guard let imageURL = URL(string: url) else {
            return
        }
        let iconCache = NSCache<NSString, UIImage>()
        
        let task = URLSession.shared.dataTask(with: imageURL) { data, _, _ in
            guard let data = data else {
                return
            }
            if let iconCacheImage = iconCache.object(forKey: url as NSString) {
                iconImage = iconCacheImage
            } else {
                let newImage = UIImage(data: data)
                iconCache.setObject(newImage ?? UIImage(), forKey: url as NSString)
                iconImage = newImage
            }
        }
        task.resume()
        
        DispatchQueue.main.async {
            self.image = iconImage
        }
    }
}

