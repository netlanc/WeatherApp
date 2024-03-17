//
//  ComponentFactory.swift
//  WeatherApp
//
//  Created by netlanc on 25.02.2024.
//

import UIKit

protocol UIComponentFactory {
    func createButton(withTitle title: String, option: ButtonOption) -> UIButton
    func createLabel(withText text: String, option: LabelOption) -> UILabel
    func createImageView(withImage imageName: String, option: ImageOption) -> UIImageView

}

class BootstrapUIComponentFactory: UIComponentFactory {

    static let shared = BootstrapUIComponentFactory()
    
    private init() {}
    
    func createButton(withTitle title: String, option: ButtonOption = ButtonOption()) -> UIButton {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        
        var buttonSize: ButtonSize = .base
        var fontSize: FontSize = .base
        var shadowEnabled = false
        
        let optionType = option.type
        if let type = optionType, type == .info || type == .success || type == .success || type == .light {
            button.setTitleColor(.darkGray, for: .normal)
        } else {
            button.setTitleColor(.white, for: .normal)
        }
        
        if let cornerRadius = option.cornerRadius {
            button.layer.cornerRadius = cornerRadius
        }
        
        buttonSize = option.size ?? .base
        fontSize = option.fontSize
        shadowEnabled = option.shadowEnabled
        
        let insets = buttonSize.contentEdgeInsets
        button.contentEdgeInsets = insets
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize.rawValue)
        
        let buttonType = optionType?.backgroundColor ?? ButtonType.base.backgroundColor
        button.backgroundColor = buttonType
        
        if shadowEnabled {
            button.layer.shadowColor = buttonType.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowOpacity = 0.7
            button.layer.shadowRadius = 10
            button.layer.masksToBounds = false
        }
        
        return button
    }
    
    func createLabel(withText text: String, option: LabelOption = LabelOption()) -> UILabel {
        let label = UILabel()
        label.text = text

        var attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: option.fontSize.rawValue, weight: option.fontWeight),
            .foregroundColor: option.textColor.color
        ]

        if let lineHeight = option.lineHeight {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = lineHeight
            attributes[.paragraphStyle] = paragraphStyle
        }
        
        if option.isUnderlined {
            attributes[.underlineStyle] = NSUnderlineStyle.single.rawValue
        }
        
        label.attributedText = NSAttributedString(string: text, attributes: attributes)
        
        if option.isMultiline {
            label.numberOfLines = 0
        } else {
            label.numberOfLines = 1
        }
        label.textAlignment = option.textAlignment
        
        
        return label
    }


    
    func createImageView(withImage imageName: String, option: ImageOption = ImageOption()) -> UIImageView {
        // Проверяем, есть ли изображение с данным именем
        guard let image = UIImage(named: imageName) else {
    
            return UIImageView()
        }

        let imageView = UIImageView(image: image)
        
        if let width = option.width {
            let ratio = image.size.width / image.size.height
            imageView.contentMode = .scaleAspectFit
            imageView.widthAnchor.constraint(equalToConstant: width).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: width / ratio).isActive = true
        }
        
        return imageView
    }
    
    // todo: по идее ей тут не место но мне лель пока куда то переносить
    func determineScreenOrientation() -> UIInterfaceOrientation {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return windowScene.interfaceOrientation
        } else {
            // Если не удается определить ориентацию, возвращаем вертикальную ориентацию по умолчанию
            return .portrait
        }
    }



    func createCustomSwitcher(withOption option: CustomSwitcherOption, buttonPressedHandler: @escaping (String) -> Void) -> UIView {
        let customSwitcher = UIView()
        
        let additionalLabel = componentFactory.createLabel(withText: option.titleText, option: LabelOption(fontSize: .base, fontWeight: .regular, textColor: .gray))
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        
        let button1Type: ButtonType = (option.buttonActive == 1) ? .primary:.info
        let button2Type: ButtonType = (option.buttonActive == 1) ? .info:.primary

        let button1 = createButton(withTitle: option.button1Text, option: ButtonOption(type: button1Type, size: option.buttonSize, fontSize: .base, cornerRadius: nil))

        let button2 = createButton(withTitle: option.button2Text, option: ButtonOption(type: button2Type, size: option.buttonSize, shadowEnabled: false, fontSize: .base, cornerRadius: nil))

        // Привязка замыкания к кнопкам
        button1.addAction(UIAction(handler: { _ in
            self.buttonTapped(button1, button2)
            buttonPressedHandler(option.value1)
        }), for: .touchUpInside)

        button2.addAction(UIAction(handler: { _ in
            self.buttonTapped(button1, button2)
            buttonPressedHandler(option.value2)
        }), for: .touchUpInside)
        
        let viewButtons = UIView()
        viewButtons.layer.cornerRadius = 5
        viewButtons.clipsToBounds = true
        
        viewButtons.addSubview(button1)
        viewButtons.addSubview(button2)
        
        stackView.addArrangedSubview(additionalLabel)
        stackView.addArrangedSubview(viewButtons)
        
        customSwitcher.addSubview(stackView)
        
        additionalLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        viewButtons.translatesAutoresizingMaskIntoConstraints = false
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            additionalLabel.topAnchor.constraint(equalTo: stackView.topAnchor),
            additionalLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            additionalLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            
            viewButtons.heightAnchor.constraint(equalTo: stackView.heightAnchor),
            
            button1.topAnchor.constraint(equalTo: viewButtons.topAnchor),
            button1.leadingAnchor.constraint(equalTo: viewButtons.leadingAnchor),
            button1.bottomAnchor.constraint(equalTo: viewButtons.bottomAnchor),
            
            button2.topAnchor.constraint(equalTo: viewButtons.topAnchor),
            button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor),
            button2.trailingAnchor.constraint(equalTo: viewButtons.trailingAnchor),
            button2.bottomAnchor.constraint(equalTo: viewButtons.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: customSwitcher.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: customSwitcher.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: customSwitcher.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: customSwitcher.bottomAnchor)
            
        ])
        
        return customSwitcher
    }

    // Меняем цвет кнопок свитчера
    @objc private func buttonTapped(_ button1: UIButton, _ button2: UIButton) {
        
        let button1BackgroundColor = button1.backgroundColor
        let button1TextColor = button1.titleColor(for: .normal)
        let button2BackgroundColor = button2.backgroundColor
        let button2TextColor = button2.titleColor(for: .normal)
        
        button1.backgroundColor = button2BackgroundColor
        button2.backgroundColor = button1BackgroundColor
        
        button1.setTitleColor(button2TextColor, for: .normal)
        button2.setTitleColor(button1TextColor, for: .normal)
        
    }
    

}

