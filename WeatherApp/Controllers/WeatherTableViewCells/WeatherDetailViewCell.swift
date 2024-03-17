//
//  WeatherDetailCell.swift
//  WeatherApp
//
//  Created by netlanc on 13.03.2024.
//

import UIKit

class WeatherDetailViewCell: UITableViewCell {
    
    static let reuseIdentifier = "weatherDetailCell"
    
    weak var parentViewController: UIViewController?
    
    let detailLabel = componentFactory.createLabel(withText: "Подробнее на 24 часа", option: LabelOption(fontSize: .medium, isUnderlined: true))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.isUserInteractionEnabled = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(detailLabelTapped(_:)))
        detailLabel.addGestureRecognizer(tapGestureRecognizer)
        
        contentView.addSubview(detailLabel)
        
        NSLayoutConstraint.activate([
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            detailLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    // обработка тапа на 24
    @objc func detailLabelTapped(_ sender: UITapGestureRecognizer) {

        if let weatherViewController = parentViewController as? WeatherViewController {

            // переходим на экран погоды на 24 часа
            weatherViewController.openWeather24()
        }
    }
}
