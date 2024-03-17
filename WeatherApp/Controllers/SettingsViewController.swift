//
//  SettingsViewController.swift
//  WeatherApp
//
//  Created by netlanc on 26.02.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let contentContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorEnum.lightGreen.color
        view.layer.cornerRadius = 10
        return view
    }()
    
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "xmark")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let labelTitle = componentFactory.createLabel(withText: "Настройки", option: LabelOption(fontSize: .medium, fontWeight: .medium))
    
    // Buttons
    let buttonSave = componentFactory.createButton(withTitle: "Установить", option: ButtonOption(type: .orangeLight))
    
    // Image
    let imageCloud1 = componentFactory.createImageView(withImage: "Cloud1")
    let imageCloud2 = componentFactory.createImageView(withImage: "Cloud2")
    let imageCloud3 = componentFactory.createImageView(withImage: "Cloud3")
    
    let switcherTermal: UIView = {
        let customSwitcherOption = CustomSwitcherOption(
            titleText: "Температура",
            button1Text: "C",
            button2Text: "F",
            buttonSize: .small,
            buttonActive: 1,
            value1: "C",
            value2: "F"
        )
        
        let customSwitcher = componentFactory.createCustomSwitcher(
            withOption: customSwitcherOption,
            buttonPressedHandler: { value in
                print("Температура value: \(value)")
            }
        )
        
        customSwitcher.translatesAutoresizingMaskIntoConstraints = false
        
        return customSwitcher
    }()
    
    // Additional customSwitcherViews
    let switcherWindSpeed: UIView = {
        let customSwitcherOption = CustomSwitcherOption(
            titleText: "Скорость ветра",
            button1Text: "Mi",
            button2Text: "Km",
            buttonSize: .small,
            buttonActive: 1,
            value1: "Mi",
            value2: "Km"
        )
        
        let customSwitcher = componentFactory.createCustomSwitcher(
            withOption: customSwitcherOption,
            buttonPressedHandler: { value in
                print("Скорость ветра value: \(value)")
            }
        )
        
        customSwitcher.translatesAutoresizingMaskIntoConstraints = false
        
        return customSwitcher
    }()
    
    let switcherTimeFormat: UIView = {
        let customSwitcherOption = CustomSwitcherOption(
            titleText: "Формат времени",
            button1Text: "12",
            button2Text: "24",
            buttonSize: .small,
            buttonActive: 1,
            value1: "12",
            value2: "24"
        )
        
        let customSwitcher = componentFactory.createCustomSwitcher(
            withOption: customSwitcherOption,
            buttonPressedHandler: { value in
                print("Формат времени value: \(value)")
            }
        )
        
        customSwitcher.translatesAutoresizingMaskIntoConstraints = false
        
        return customSwitcher
    }()
    
    let switcherNotifications: UIView = {
        let customSwitcherOption = CustomSwitcherOption(
            titleText: "Уведомления",
            button1Text: "On",
            button2Text: "Off",
            buttonSize: .small,
            buttonActive: 2,
            value1: "On",
            value2: "Off"
        )
        
        let customSwitcher = componentFactory.createCustomSwitcher(
            withOption: customSwitcherOption,
            buttonPressedHandler: { value in
                print("Уведомления value: \(value)")
            }
        )
        
        customSwitcher.translatesAutoresizingMaskIntoConstraints = false
        
        return customSwitcher
    }()
    
    // Свойства для хранения констрейнтов
    private var portraitConstraints = [NSLayoutConstraint]()
    private var landscapeConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ColorEnum.blue.color
        
        view.addSubview(imageCloud1)
        view.addSubview(imageCloud2)
        view.addSubview(imageCloud3)
        
        view.addSubview(contentContainerView)
        
        contentContainerView.addSubview(labelTitle)
        contentContainerView.addSubview(switcherTermal)
        contentContainerView.addSubview(switcherWindSpeed)
        contentContainerView.addSubview(switcherTimeFormat)
        contentContainerView.addSubview(switcherNotifications)
        contentContainerView.addSubview(buttonSave)
        
        view.addSubview(closeButton)

        contentContainerView.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        
        imageCloud1.translatesAutoresizingMaskIntoConstraints = false
        imageCloud2.translatesAutoresizingMaskIntoConstraints = false
        imageCloud3.translatesAutoresizingMaskIntoConstraints = false
        
        setupConstraint()
        setupConstraintCloud()
        
    }
    
    private func setupConstraint() {
        
        let widthContainerView = min(500, view.bounds.width - 40)
        
        portraitConstraints = [
            contentContainerView.widthAnchor.constraint(equalToConstant: widthContainerView),
            contentContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            labelTitle.topAnchor.constraint(equalTo: contentContainerView.topAnchor, constant: 20),
            labelTitle.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: 20),
            labelTitle.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -20),
            
            switcherTermal.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10),
            switcherTermal.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: 20),
            switcherTermal.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -20),
            
            switcherWindSpeed.topAnchor.constraint(equalTo: switcherTermal.bottomAnchor, constant: 20),
            switcherWindSpeed.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: 20),
            switcherWindSpeed.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -20),
            
            switcherTimeFormat.topAnchor.constraint(equalTo: switcherWindSpeed.bottomAnchor, constant: 20),
            switcherTimeFormat.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: 20),
            switcherTimeFormat.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -20),
            
            switcherNotifications.topAnchor.constraint(equalTo: switcherTimeFormat.bottomAnchor, constant: 20),
            switcherNotifications.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: 20),
            switcherNotifications.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -20),
            
            buttonSave.topAnchor.constraint(equalTo: switcherNotifications.bottomAnchor, constant: 40),
            buttonSave.leadingAnchor.constraint(equalTo: contentContainerView.leadingAnchor, constant: 40),
            buttonSave.trailingAnchor.constraint(equalTo: contentContainerView.trailingAnchor, constant: -40),
            buttonSave.bottomAnchor.constraint(equalTo: contentContainerView.bottomAnchor, constant: -20),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)

        ]
        
        NSLayoutConstraint.activate(portraitConstraints)
        
    }
    
    private func setupConstraintCloud() {
        
        NSLayoutConstraint.activate([
            // Констрейнты для изображений облаков
            imageCloud1.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            imageCloud1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130),
            
            imageCloud2.topAnchor.constraint(equalTo: imageCloud1.bottomAnchor, constant: 20),
            imageCloud2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            
            imageCloud3.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -130),
            imageCloud3.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    
    private func removeAllConstraint() {
        view.removeConstraints(portraitConstraints)
        NSLayoutConstraint.deactivate(portraitConstraints)
    }
    
    // Метод для обновления констрейнтов при изменении ориентации
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { context in
            // Здесь можно анимировать изменения, если требуется
        }) { context in
            
            self.removeAllConstraint()
            self.setupConstraint()
            
        }
    }
    
    @objc func button1Tapped() {
        print("Нажата кнопка 1")
    }
    
    @objc func button2Tapped() {
        print("Нажата кнопка 2")
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
