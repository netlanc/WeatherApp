//
//  Weather24HourTableViewCell.swift
//  WeatherApp
//
//  Created by netlanc on 16.03.2024.
//

import UIKit

class Weather24HourTableViewCell: UITableViewCell {
    static let reuseIdentifier = "weather24HourCell"

    private let labelText: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupSubviews() {
        
        
        contentView.backgroundColor = ColorEnum.customLightGray.color
        contentView.addSubview(labelText)
        
        NSLayoutConstraint.activate([

            labelText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            labelText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
        ])
    }
    
    // Функция для установки содержимого ячейки
    func setContent(_ content: String) {
        labelText.text = content
    }

}
