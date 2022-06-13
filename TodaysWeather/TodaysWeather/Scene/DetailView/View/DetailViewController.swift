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
    var weatherInfo: WeatherInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        guard let weatherInfo = self.weatherInfo else {
            return
        }
        
        self.cityNameLabel.text = weatherInfo.cityName
        self.iconImageView.loadImage(iconCode: weatherInfo.weatherBasicsInfo.first?.icon)
        self.discriptionLabel.text = weatherInfo.weatherBasicsInfo.first?.description
        self.currentTemperatureLabel.text = String(weatherInfo.weatherCondition.currentTemperatures)
        self.feelsTemperatureLabel.text = String(weatherInfo.weatherCondition.sensibleTemperatures)
        self.minTemperatureLabel.text = String(weatherInfo.weatherCondition.minimumTemperatures)
        self.maxTemperatureLabel.text = String(weatherInfo.weatherCondition.maximumTemperatures)
        self.humidityLabel.text = String(weatherInfo.weatherCondition.currentHumidity)
        self.windSpeedLabel.text = String(weatherInfo.windCondition.speed)
        self.pressureLabel.text = String(weatherInfo.weatherCondition.pressure)
    }
}
