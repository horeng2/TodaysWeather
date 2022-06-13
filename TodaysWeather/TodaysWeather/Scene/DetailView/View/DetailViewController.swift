//
//  DetailViewController.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/13.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var feelsTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    var weatherInfo: WeatherInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        guard let weatherInfo = self.weatherInfo else {
            return
        }
        self.cityNameLabel.text = weatherInfo.cityName
        self.iconImageView.loadImage(iconCode: weatherInfo.iconCode)
        self.discriptionLabel.text = weatherInfo.description
        self.currentTemperatureLabel.text = "\(weatherInfo.currentTemperatures)\(TemperatureUnit.celsius.symbol())"
        self.feelsTemperatureLabel.text = "\(weatherInfo.feelsTemperatures)\(TemperatureUnit.celsius.symbol())"
        self.minTemperatureLabel.text = "\(weatherInfo.minimumTemperatures)\(TemperatureUnit.celsius.symbol())"
        self.maxTemperatureLabel.text = "\(weatherInfo.maximumTemperatures)\(TemperatureUnit.celsius.symbol())"
        self.humidityLabel.text = "\(weatherInfo.currentHumidity)\(TemperatureUnit.humidity.symbol())"
        self.windSpeedLabel.text = "\(weatherInfo.windSpeed)\(TemperatureUnit.windSpeed.symbol())"
        self.pressureLabel.text = "\(weatherInfo.pressure)\(TemperatureUnit.pressure.symbol())"
    }
}
