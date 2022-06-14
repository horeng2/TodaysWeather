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
    @IBOutlet weak var currentTempTitleLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var feelsTempTitleLabel: UILabel!
    @IBOutlet weak var feelsTemperatureLabel: UILabel!
    @IBOutlet weak var minTempTitleLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempTitleLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var humidityTitleLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windSpeedTitleLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var pressureTitleLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    var weatherInfo: WeatherInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureStyle()
        self.configureWeaterInfo()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "nightSky")!)
    }
    
    func configureWeaterInfo() {
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
    
    func configureStyle() {
        self.navigationController?.navigationBar.tintColor = .white
        self.cityNameLabel.textColor = .white
        self.discriptionLabel.textColor = .white
        self.currentTempTitleLabel.textColor = .white
        self.currentTemperatureLabel.textColor = .white
        self.feelsTempTitleLabel.textColor = .white
        self.feelsTemperatureLabel.textColor = .white
        self.minTempTitleLabel.textColor = .white
        self.minTemperatureLabel.textColor = .white
        self.maxTempTitleLabel.textColor = .white
        self.maxTemperatureLabel.textColor = .white
        self.humidityTitleLabel.textColor = .white
        self.humidityLabel.textColor = .white
        self.windSpeedTitleLabel.textColor = .white
        self.windSpeedLabel.textColor = .white
        self.pressureTitleLabel.textColor = .white
        self.pressureLabel.textColor = .white
        
        self.cityNameLabel.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        self.discriptionLabel.font = UIFont.systemFont(ofSize: 25)
        self.currentTempTitleLabel.font = UIFont.systemFont(ofSize: 20)
        self.currentTemperatureLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.feelsTempTitleLabel.font = UIFont.systemFont(ofSize: 20)
        self.feelsTemperatureLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.minTempTitleLabel.font = UIFont.systemFont(ofSize: 20)
        self.minTemperatureLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.maxTempTitleLabel.font = UIFont.systemFont(ofSize: 20)
        self.maxTemperatureLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.humidityTitleLabel.font = UIFont.systemFont(ofSize: 20)
        self.humidityLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.windSpeedTitleLabel.font = UIFont.systemFont(ofSize: 20)
        self.windSpeedLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        self.pressureTitleLabel.font = UIFont.systemFont(ofSize: 20)
        self.pressureLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    }
}
