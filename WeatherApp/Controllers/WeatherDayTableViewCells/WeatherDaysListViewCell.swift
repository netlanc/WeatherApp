//
//  WeatherDaysListViewCell.swift
//  WeatherApp
//
//  Created by netlanc on 16.03.2024.
//
import UIKit

class WeatherDaysListViewCell: UITableViewCell {
    
    static let reuseIdentifier = "weatherDaysListCell"
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 16

        
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: viewLayout
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        
        collectionView.register(WeatherDayLitsCollectionViewItem.self, forCellWithReuseIdentifier: WeatherDayLitsCollectionViewItem.reuseIdentifier)

        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension WeatherDaysListViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherDayLitsCollectionViewItem.reuseIdentifier, for: indexPath) as? WeatherDayLitsCollectionViewItem else {
            fatalError("Failed to dequeue WeatherHourCollectionViewItem")
        }
        
        cell.configure(index: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 94, height: 36)
    }
}

extension WeatherDaysListViewCell: UICollectionViewDelegateFlowLayout {
    
    // добавляем отсупы слева и справа что бы было красиво
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 16, bottom: 30, right: 16)
    }
}

