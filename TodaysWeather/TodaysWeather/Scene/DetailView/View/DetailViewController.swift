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
        
        guard let iconCode = weatherInfo.weatherBasicsInfo.first?.icon else {
            return
        }
        self.cityNameLabel.text = weatherInfo.cityName
        self.iconImageView.loadImage(url: "http://openweathermap.org/img/wn/\(iconCode)@2x.png")
        self.discriptionLabel.text = weatherInfo.weatherBasicsInfo.description
        self.currentTemperatureLabel.text = String(weatherInfo.weatherCondition.currentTemperatures)
        self.feelsTemperatureLabel.text = String(weatherInfo.weatherCondition.sensibleTemperatures)
        self.minTemperatureLabel.text = String(weatherInfo.weatherCondition.minimumTemperatures)
        self.maxTemperatureLabel.text = String(weatherInfo.weatherCondition.maximumTemperatures)
        self.humidityLabel.text = String(weatherInfo.weatherCondition.currentHumidity)
        self.windSpeedLabel.text = String(weatherInfo.windCondition.speed)
        self.pressureLabel.text = String(weatherInfo.weatherCondition.pressure)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
