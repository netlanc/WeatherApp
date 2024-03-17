//
//  WeatherDaysDayTimeViewCell.swift
//  WeatherApp
//
//  Created by netlanc on 17.03.2024.
//

import UIKit

class WeatherDaysDayTimeViewCell: UITableViewCell {
    static let reuseIdentifier = "weatherDaysDayTimeCell"
    
    private let containerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = ColorEnum.customLightGray.color
        view.layer.cornerRadius = 5
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let labelTitle = componentFactory.createLabel(withText: "", option: LabelOption(fontSize: .medium, fontWeight: .medium))
    
    private let labelTemperature = componentFactory.createLabel(withText: "10", option: LabelOption(fontSize: .xxxLarge, fontWeight: .medium))
    private let iconDayTime = componentFactory.createImageView(withImage: "iconRain")

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        contentView.addSubview(containerView)
        containerView.addSubview(labelTitle)
        containerView.addSubview(iconDayTime)
        containerView.addSubview(labelTemperature)
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        iconDayTime.translatesAutoresizingMaskIntoConstraints = false
        labelTemperature.translatesAutoresizingMaskIntoConstraints = false
        
        let containerViewWidth = contentView.bounds.width
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            labelTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            labelTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            
            iconDayTime.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            iconDayTime.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: (containerViewWidth / 2)),
            
            labelTemperature.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            labelTemperature.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -(containerViewWidth / 2)),
        ])
        
        
    }
    
    func configure(with text: String) {
        labelTitle.text = text
    }
}
