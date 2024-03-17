//
//  SceneDelegate.swift
//  WeatherApp
//
//  Created by netlanc on 24.02.2024.
//

import UIKit

let componentFactory = BootstrapUIComponentFactory.shared // Создание экземпляра фабрики

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
//        window?.rootViewController = SettingsViewController()
//        window?.rootViewController = OnboardingViewController()
//        window?.rootViewController = WeatherViewController()
//        window?.rootViewController = Weather24ViewController()
//        window?.rootViewController = WeatherDayViewController()
//        window?.rootViewController = ViewController()

        let weatherVC = WeatherViewController()
        let navController = UINavigationController(rootViewController: weatherVC)
        
        // Устанавливаем UINavigationController как корневой контроллер для окна приложения
        let window = UIWindow(windowScene: scene)
        window.rootViewController = navController
        self.window = window
        
        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }


}

