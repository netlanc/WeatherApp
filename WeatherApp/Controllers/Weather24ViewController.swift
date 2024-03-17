//
//  Weather24ViewController.swift
//  WeatherApp
//
//  Created by netlanc on 05.03.2024.
//
import UIKit

class Weather24ViewController: UIViewController {
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Город"
        
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(Weather24HourTableViewCell.self, forCellReuseIdentifier: Weather24HourTableViewCell.reuseIdentifier)
        tableView.register(Weather24HoursTableViewCell.self, forCellReuseIdentifier: Weather24HoursTableViewCell.reuseIdentifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Прогноз на 24 часа"
        
        
        view.addSubview(cityLabel)
        view.addSubview(tableView)
        
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

extension Weather24ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // Возвращаем две секции: одна для заголовка, другая для данных
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // В первой секции у нас только одна ячейка для заголовка
        // Во второй секции у нас 24 ячейки для данных
        return section == 0 ? 1 : 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Weather24HoursTableViewCell.reuseIdentifier, for: indexPath) as? Weather24HoursTableViewCell else {
                fatalError("Failed to dequeue Weather24HoursTableViewCell")
            }
            
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: Weather24HourTableViewCell.reuseIdentifier, for: indexPath) as? Weather24HourTableViewCell else {
                fatalError("Failed to dequeue Weather24HourTableViewCell")
            }
            
            // Установим цвет ячейки на основе индекса
//            cell.backgroundColor = UIColor(hue: CGFloat(indexPath.row) / 24.0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
//            cell.textLabel?.text = "\(indexPath.row)"
//            
            return cell
            
        }
        
    }
}

extension Weather24ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 175
        default:
            return 145
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
          return section == 0 ? 20 : 0 // Высота подвала секции
      }

      func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
          return UIView() // Пустая UIView для отступа
      }
}
