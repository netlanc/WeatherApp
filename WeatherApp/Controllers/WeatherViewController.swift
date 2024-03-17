//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by netlanc on 04.03.2024.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //let tableView = UITableView()
    
    let tableView: UITableView = {
        let table = UITableView()
        
        table.allowsSelection = false
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(WeatherCurrentViweCell.self, forCellReuseIdentifier: WeatherCurrentViweCell.reuseIdentifier)
        table.register(WeatherDetailViewCell.self, forCellReuseIdentifier: WeatherDetailViewCell.reuseIdentifier)
        table.register(WeatherHoursViewCell.self, forCellReuseIdentifier: WeatherHoursViewCell.reuseIdentifier)
        table.register(WeatherDaysViewCell.self, forCellReuseIdentifier: WeatherDaysViewCell.reuseIdentifier)
        
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Прогноз погоды"
    
        setupNav()
        setupTableView()
        setupConstraint()
   
    }
    
    
    private func setupTableView() {
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    private func setupNav() {
        
        // кнопки для навигации
        let leftButton = UIBarButtonItem(image: UIImage(named: "icon1"), style: .plain, target: self, action: #selector(leftButtonTapped))
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.leftBarButtonItem?.tintColor = ColorEnum.dark.color
        
        // Создаем правую кнопку в навигационной панели
        let rightButton = UIBarButtonItem(image: UIImage(named: "icon2"), style: .plain, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.rightBarButtonItem?.tintColor = ColorEnum.dark.color
        
    }
    
    // переходим на экран погоды на 24 часа
    @objc func openWeather24() {
        let weather24VC = Weather24ViewController()
        navigationController?.pushViewController(weather24VC, animated: true)
    }
    
    // переходим на экран погоды на день
    @objc func openWeatherDay(index: Int) {
        let weatherDayVC = WeatherDayViewController()
        navigationController?.pushViewController(weatherDayVC, animated: true)
        
        print(index)
    }
    
    @objc func leftButtonTapped() {
        let settingsVC = SettingsViewController()
        present(settingsVC, animated: true, completion: nil)
    }
    
    @objc func rightButtonTapped() {
        let onboardingVC = OnboardingViewController()
        present(onboardingVC, animated: true, completion: nil)
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            // ячейка с текущей погодой
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCurrentViweCell.reuseIdentifier, for: indexPath) as? WeatherCurrentViweCell else {
                fatalError("Failed to dequeue WeatherCurrentCell")
            }
            
            cell.configure()
            
            return cell
        case 1:
            // ячейка с лейблом 24
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDetailViewCell.reuseIdentifier, for: indexPath) as? WeatherDetailViewCell else {
                fatalError("Failed to dequeue DetailLabelCell")
            }
            
            cell.parentViewController = self
            
            return cell
        case 2:
            
            // ячейка с погодой по часам
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherHoursViewCell.reuseIdentifier, for: indexPath) as? WeatherHoursViewCell else {
                fatalError("Failed to dequeue WeatherHoursViewCell")
            }
            
            return cell
            
        case 3:
    
            // ячейка с погодой по дням
            guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDaysViewCell.reuseIdentifier, for: indexPath) as? WeatherDaysViewCell else {
                fatalError("Failed to dequeue WeatherDaysViewCell")
            }
            
            cell.parentViewController = self
            
            return cell
        default:
            fatalError("Unexpected row in table view")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 220
        case 1:
            return 40
        case 2:
            return 90
        case 3:
            return (25 * 66) + 66
        default:
            return UITableView.automaticDimension
        }
    }
}

