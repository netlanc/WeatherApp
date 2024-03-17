//
//  OnboardingViewController.swift
//  WeatherApp
//
//  Created by netlanc on 25.02.2024.
//
import UIKit

class OnboardingViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        
        return scrollView
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
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        
        return contentView
    }()
    
    // Labels
    let label1 = componentFactory.createLabel(withText: """
    Разрешить приложению Weather использовать данные о местоположении вашего устройства
    """, option: LabelOption(fontSize: .medium, fontWeight: .bold, lineHeight: 1.25, textColor: .white, textAlignment: .center, isMultiline: true))
    
    let label2 = componentFactory.createLabel(withText: """
    Чтобы получить более точные прогнозы погоды во время движения или путешествия
    """, option: LabelOption(fontSize: .base, fontWeight: .regular, lineHeight: 1.25, textColor: .white, textAlignment: .center, isMultiline: true))
    
    let label3 = componentFactory.createLabel(withText: """
    Вы можете изменить свой выбор в любое время из меню приложения
    """, option: LabelOption(fontSize: .base, fontWeight: .regular, lineHeight: 1.25, textColor: .white, textAlignment: .center, isMultiline: true))
    
    // Image
    let imageView = componentFactory.createImageView(withImage: "Onboarding", option: ImageOption(width: 180))
    
    // Buttons
    let buttonLocationAuto = componentFactory.createButton(withTitle: "ИСПОЛЬЗОВАТЬ МЕСТОПОЛОЖЕНИЕ УСТРОЙСТВА", option: ButtonOption(type: .orangeLight, size: .medium, fontSize: .small))
    let buttonLocationManual = componentFactory.createButton(withTitle: "НЕТ, Я БУДУ ДОБАВЛЯТЬ ЛОКАЦИИ", option: ButtonOption(type: .transparent))
    
    // Свойства для хранения констрейнтов
    private var portraitConstraints = [NSLayoutConstraint]()
    private var landscapeConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = ColorEnum.blue.color
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // Add subviews to contentView
        contentView.addSubview(imageView)
        contentView.addSubview(label1)
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(buttonLocationAuto)
        contentView.addSubview(buttonLocationManual)
        
        view.addSubview(closeButton)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        buttonLocationAuto.translatesAutoresizingMaskIntoConstraints = false
        buttonLocationManual.translatesAutoresizingMaskIntoConstraints = false

        
        if componentFactory.determineScreenOrientation() != .portrait {
            // Экран находится в вертикальной ориентации
            print("Вертикальная ориентация")
            runConstraintLandscape()
        } else {
            // Экран находится в горизонтальной ориентации
            print("Горизонтальная ориентация")
            runConstraintPortrait()
        }
    }
    
    private func removeAllConstraint() {
        view.removeConstraints(landscapeConstraints)
        view.removeConstraints(portraitConstraints)
        NSLayoutConstraint.deactivate(landscapeConstraints)
        NSLayoutConstraint.deactivate(portraitConstraints)
    }
    
    private func runConstraintPortrait() {
        removeAllConstraint()
        configConstraintPortrait()
        
        NSLayoutConstraint.activate(portraitConstraints)
    }
    
    private func runConstraintLandscape() {
        removeAllConstraint()
        configConstraintLandscape()
        
        NSLayoutConstraint.activate(landscapeConstraints)
    }
    
    // Метод для обновления констрейнтов при изменении ориентации
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { context in
            // Здесь можно анимировать изменения, если требуется
        }) { context in
            
            if componentFactory.determineScreenOrientation() != .portrait {
                // Экран находится в вертикальной ориентации
                print("Вертикальная ориентация")
                self.runConstraintLandscape()
            } else {
                // Экран находится в горизонтальной ориентации
                print("Горизонтальная ориентация")
                self.runConstraintPortrait()
            }
        }
    }
    
    private func configConstraintPortrait() {
        
        let safeArea = view.safeAreaLayoutGuide
        //
        portraitConstraints = [
            
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 90),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            label1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40),
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            label1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 40),
            label2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            label2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 20),
            label3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            label3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            buttonLocationAuto.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 30),
            buttonLocationAuto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            buttonLocationAuto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            buttonLocationManual.topAnchor.constraint(equalTo: buttonLocationAuto.bottomAnchor, constant: 10),
            //            buttonLocationManual.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            buttonLocationManual.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            buttonLocationManual.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        
        ]
    }
    private func configConstraintLandscape() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        //
        landscapeConstraints = [
            
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            label1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 74),
            label1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -74),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 10),
            label2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            label2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            label3.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
            label3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            label3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            buttonLocationAuto.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 30),
            buttonLocationAuto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 100),
            buttonLocationAuto.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -100),
            
            buttonLocationManual.topAnchor.constraint(equalTo: buttonLocationAuto.bottomAnchor, constant: 10),
            buttonLocationManual.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            buttonLocationManual.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -85),
            buttonLocationManual.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ]
    }
    
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
