//
//  ViewController.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/09.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    let vm = WeatherListViewModel()
    var weather = [WeatherInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        self.vm.test = {
            self.weather = self.vm.allData
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
        self.vm.allFetch()
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
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
