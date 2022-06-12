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
        let url = URL(string: "http://openweathermap.org/img/wn/\(iconCode)@2x.png")!
        self.weatherIconImageView.load(url: url)
        self.cityNameLabel.text = weatherInfo.cityName
        self.temperatureLable.text = String(weatherInfo.weatherCondition.currentTemperatures)
        self.humidityLabel.text = String(weatherInfo.weatherCondition.currentHumidity)
    }
}

extension UIImageView {
    func load(url: URL) {
        guard let data = try? Data(contentsOf: url),
              let image = UIImage(data: data) else {
                  return
              }
        DispatchQueue.main.async {
            self.image = image
        }
    }
}

