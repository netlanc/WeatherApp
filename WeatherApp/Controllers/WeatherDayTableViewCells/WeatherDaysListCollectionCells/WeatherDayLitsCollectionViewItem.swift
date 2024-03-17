//
//  WeatherDayLitsCollectionViewItem.swift
//  WeatherApp
//
//  Created by netlanc on 17.03.2024.
//

import UIKit

class WeatherDayLitsCollectionViewItem: UICollectionViewCell {
    
    static let reuseIdentifier = "weatherDayListCollectionItem"
    
    
    var buttonDay = componentFactory.createButton(withTitle: "12/1 ПН", option: ButtonOption(type: .light, fontSize: .large, cornerRadius: 5))

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        addSubview(buttonDay)
        buttonDay.translatesAutoresizingMaskIntoConstraints = false
        
        buttonDay.contentEdgeInsets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        
        NSLayoutConstraint.activate([
            buttonDay.topAnchor.constraint(equalTo: topAnchor),
            buttonDay.leadingAnchor.constraint(equalTo: leadingAnchor),
            buttonDay.trailingAnchor.constraint(equalTo: trailingAnchor),
            buttonDay.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(index: Int) {
        
        buttonDay.setTitle("12/\(index)ПН", for: .normal)
        
        if index == 0 {
            buttonDay.backgroundColor = ColorEnum.blue.color
            buttonDay.setTitleColor(.white, for: .normal)
        } else {
            buttonDay.layer.borderWidth = 0.5
            buttonDay.layer.borderColor = ColorEnum.lightBlue.color.cgColor
        }
    }
}
