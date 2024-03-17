//
//  WeatherDaysViewCell.swift
//  WeatherApp
//
//  Created by netlanc on 13.03.2024.
//

import UIKit

class WeatherDaysViewCell: UITableViewCell {
    
    static let reuseIdentifier = "weatherDaysCell"
    
    weak var parentViewController: UIViewController?
    
        
    let stackDaysView = UIStackView()
    
    let labelDaysTitle = componentFactory.createLabel(withText: "Ежедневный прогноз", option: LabelOption(fontSize: .large, fontWeight: .bold))
    
    let labelDaysCount = componentFactory.createLabel(withText: "25 дней", option: LabelOption(fontSize: .medium, isUnderlined: true))
 
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {

        stackDaysView.axis = .vertical
        stackDaysView.distribution = .fillEqually
        stackDaysView.alignment = .fill
        stackDaysView.spacing = 10
        
        stackDaysView.translatesAutoresizingMaskIntoConstraints = false
        stackDaysView.clipsToBounds = true
        
        labelDaysTitle.translatesAutoresizingMaskIntoConstraints = false
        labelDaysCount.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labelDaysTitle)
        contentView.addSubview(labelDaysCount)
        contentView.addSubview(stackDaysView)
        
        NSLayoutConstraint.activate([
            
            labelDaysTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            labelDaysTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            labelDaysTitle.heightAnchor.constraint(equalToConstant: 24),
            
            labelDaysCount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            labelDaysCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            labelDaysCount.heightAnchor.constraint(equalToConstant: 24),
            
            stackDaysView.topAnchor.constraint(equalTo: labelDaysTitle.bottomAnchor, constant: 16),
            stackDaysView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackDaysView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackDaysView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        for index in 1...25 {
            let dayView = UIView()
            dayView.layer.cornerRadius = 5
            dayView.backgroundColor = ColorEnum.customLightGray.color
            //dayView.translatesAutoresizingMaskIntoConstraints = false
            //dayView.heightAnchor.constraint(equalToConstant: 56).isActive = true
            
            let labelDaysTitle2 = componentFactory.createLabel(withText: "\(index)", option: LabelOption(fontSize: .large, fontWeight: .bold))
            
            labelDaysTitle2.translatesAutoresizingMaskIntoConstraints = false
            
            dayView.addSubview(labelDaysTitle2)
            NSLayoutConstraint.activate([
                
                labelDaysTitle2.centerXAnchor.constraint(equalTo: dayView.centerXAnchor),
                labelDaysTitle2.centerYAnchor.constraint(equalTo: dayView.centerYAnchor),
            ])
            
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dayViewTapped(_:)))
                        dayView.addGestureRecognizer(tapGestureRecognizer)
            
            stackDaysView.addArrangedSubview(dayView)
        }

    }
    
    // обработка тапа на день
    @objc func dayViewTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedDayView = sender.view, let index = stackDaysView.arrangedSubviews.firstIndex(of: tappedDayView) else {
            return
        }
        if let weatherViewController = parentViewController as? WeatherViewController {
            
            // переходим на экран погоды на день
            weatherViewController.openWeatherDay(index: index)
        }
    }
}
