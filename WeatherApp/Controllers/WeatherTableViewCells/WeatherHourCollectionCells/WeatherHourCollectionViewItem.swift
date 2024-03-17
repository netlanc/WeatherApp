//
//  WeatherHourCollectionViewItem.swift
//  WeatherApp
//
//  Created by netlanc on 13.03.2024.
//

import UIKit

class WeatherHourCollectionViewItem: UICollectionViewCell {
    
    static let reuseIdentifier = "weatherHourCollectionItem"
    
    
    let label: UILabel = {
        let label = UILabel()
        
        label.text = "Item"
        label.textAlignment = .center
        
        label.layer.cornerRadius = 21
        label.layer.masksToBounds = true
        label.backgroundColor = .clear
        
        label.layer.borderWidth = 0.3
        label.layer.borderColor = ColorEnum.lightBlue.color.cgColor
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
