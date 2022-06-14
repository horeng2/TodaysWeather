//
//  ViewController.swift
//  TodaysWeather
//
//  Created by 서녕 on 2022/06/09.
//

import UIKit

class ListViewController: UIViewController {
    @IBOutlet weak var listTableView: UITableView!
    private let weatherListViewModel = WeatherListViewModel()
    private var listTableViewDataSource = [WeatherInformation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        self.weatherListViewModel.allWeatherInfoUpdated = {
            self.listTableViewDataSource = self.weatherListViewModel.allWeatherInfo
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
        self.weatherListViewModel.fetchAllWeatherInfo()
    }
    
    private func configureTableView() {
        self.listTableView.dataSource = self
        self.listTableView.delegate = self
        let tableViewBackgroundImage = UIImage(named: "sky")
        self.listTableView.backgroundView = UIImageView(image: tableViewBackgroundImage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
    ) {
        if segue.identifier == "showDetail" {
            let nextViewController = segue.destination as? DetailViewController
            if let index = sender as? Int{
                nextViewController?.weatherInfo = listTableViewDataSource[index]
            }
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return City.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if listTableViewDataSource.isEmpty {
            tableView.isHidden = true
            return UITableViewCell()
        }
        tableView.isHidden = false
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as? ListTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(weatherInfo: listTableViewDataSource[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        return 70
    }
    
    func tableView(
        _ tableView: UITableView,
        willDisplay cell: UITableViewCell,
        forRowAt indexPath: IndexPath
    ) {
        let cellBackgroundView = UIView()
        cellBackgroundView.backgroundColor = .clear
        cell.selectedBackgroundView = cellBackgroundView
        cell.backgroundColor = UIColor.clear
    }
}

