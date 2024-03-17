//
//  WeatherCurrentCell.swift
//  WeatherApp
//
//  Created by netlanc on 13.03.2024.
//

import UIKit

class WeatherCurrentViweCell: UITableViewCell {
    
    static let reuseIdentifier = "weatherCurrentCell"
    
    let weatherView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorEnum.blue.color
        view.layer.cornerRadius = 5
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
    
        contentView.addSubview(weatherView)
        
        NSLayoutConstraint.activate([
            weatherView.topAnchor.constraint(equalTo: contentView.topAnchor),
            weatherView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            weatherView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            weatherView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func configure() {
        
    }
}


