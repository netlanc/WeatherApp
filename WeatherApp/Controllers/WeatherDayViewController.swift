//
//  WeatherDayViewController.swift
//  WeatherApp
//
//  Created by netlanc on 05.03.2024.
//

import UIKit

class WeatherDayViewController: UIViewController {
    
    private let cityLabel = componentFactory.createLabel(withText: "Город", option: LabelOption(fontSize: .medium, fontWeight: .bold))

    let tableView: UITableView = {
        let table = UITableView()
        
        table.separatorStyle = .none
        
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(WeatherDaysListViewCell.self, forCellReuseIdentifier: WeatherDaysListViewCell.reuseIdentifier)
        table.register(WeatherDaysInfoViewCell.self, forCellReuseIdentifier: WeatherDaysInfoViewCell.reuseIdentifier)
        table.register(WeatherDaysDayTimeViewCell.self, forCellReuseIdentifier: WeatherDaysDayTimeViewCell.reuseIdentifier)
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Прогноз на день"
        
        
        view.addSubview(cityLabel)
        view.addSubview(tableView)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupContraints()
    }
    
    
    private func setupContraints() {
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            
            tableView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension WeatherDayViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            
            // Список дней
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDaysListViewCell.reuseIdentifier, for: indexPath) as? WeatherDaysListViewCell else {
                fatalError("Failed to dequeue WeatherDaysListViewCell")
            }
            
            return cell
            
        case 3:
            
            // Солнце и Луна
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDaysInfoViewCell.reuseIdentifier, for: indexPath) as? WeatherDaysInfoViewCell else {
                fatalError("Failed to dequeue WeatherDaysInfoViewCell")
            }
            
            cell.configure(with: "Солнце и Луна")
            
            return cell
            
        default:
            
            // День или ночь
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDaysDayTimeViewCell.reuseIdentifier, for: indexPath) as? WeatherDaysDayTimeViewCell else {
                fatalError("Failed to dequeue WeatherDaysInfoViewCell")
            }
            
            var titleText = "День"
            if indexPath.row == 2 {
                titleText = "Ночь"
            }
            
            cell.configure(with: titleText)
            
            return cell
        }
        
        
    }
}

extension WeatherDayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100
        case 3:
            return 400
        default:
            return 700
        }
    }
}
