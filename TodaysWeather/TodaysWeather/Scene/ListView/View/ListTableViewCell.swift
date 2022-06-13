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
        self.weatherIconImageView.loadImage(iconCode: weatherInfo.weatherBasicsInfo.first?.icon)
        self.cityNameLabel.text = weatherInfo.cityName
        self.temperatureLable.text = "현재기온: \(weatherInfo.weatherCondition.currentTemperatures)"
        self.humidityLabel.text = "현재습도: \(weatherInfo.weatherCondition.currentHumidity)"
    }
}
