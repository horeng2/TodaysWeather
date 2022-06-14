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
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    func configure(weatherInfo: WeatherInformation) {
        self.weatherIconImageView.loadImage(iconCode: weatherInfo.iconCode)
        self.cityNameLabel.text = weatherInfo.cityName
        self.temperatureLabel.text = "☀️ \(weatherInfo.currentTemperatures)\(TemperatureUnit.celsius.symbol())"
        self.humidityLabel.text = "💧 \(weatherInfo.currentHumidity)\(TemperatureUnit.humidity.symbol())"
    }
}
