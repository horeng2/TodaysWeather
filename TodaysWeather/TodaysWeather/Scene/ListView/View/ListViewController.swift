//
//  ViewController.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/09.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    let weatherListViewModel = WeatherListViewModel()
    var weather = [WeatherInformation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.weatherListViewModel.allWeatherInfoUpdated = {
            self.weather = self.weatherListViewModel.allWeatherInfo
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
        self.weatherListViewModel.fetchAllWeatherInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func configureTableView() {
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int{
                vc?.weatherInfo = weather[index]
            }
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return City.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if weather.isEmpty {
            tableView.isHidden = true
            return UITableViewCell()
        }
        tableView.isHidden = false
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(weatherInfo: weather[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cellBackgroundView = UIView()
        cellBackgroundView.backgroundColor = .clear
        
        cell.selectedBackgroundView = cellBackgroundView
        cell.backgroundColor = UIColor.clear
    }
}
