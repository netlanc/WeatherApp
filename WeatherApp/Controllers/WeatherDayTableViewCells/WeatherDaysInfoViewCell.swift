//
//  WeatherDaysInfoViewCell.swift
//  WeatherApp
//
//  Created by netlanc on 17.03.2024.
//

import UIKit

class WeatherDaysInfoViewCell: UITableViewCell {
    static let reuseIdentifier = "weatherDaysInfoCell"
    
    private let containerView: UIView = {
        let view = UIView()
        
        view.layer.borderColor = ColorEnum.lightBlue.color.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 5
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let labelTitle = componentFactory.createLabel(withText: "", option: LabelOption(fontSize: .medium, fontWeight: .medium))

    
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
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            labelTitle.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            labelTitle.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            labelTitle.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            labelTitle.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    func configure(with text: String) {
        labelTitle.text = text
    }
}
