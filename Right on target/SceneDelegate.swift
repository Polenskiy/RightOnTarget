//
//  SceneDelegate.swift
//  Right on target
//
//  Created by Daniil Polenskii on 05.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    //Вызывается перед тем, как UIKit присоединяет новую сцену
    //(экземпляр интерфейса) к приложению.
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        print("willConnectTo - подключится к")
    }
    
    //вызывается перед переходом сцены в состояние Foreground,
    //т.е. прямо перед тем, как будет отображен графический интерфейс.
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("sceneWillEnterForeground - сцена выйдет на передний план")
    }
    
    //После того, как сцена отобразилась на экране и
    //стала активной для взаимодействия, вызывается
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("sceneDidBecomeActive - сцена стала активной")
    }
    
    //вызывается перед тем, как сцена перейдет в состояние Foreground Inactive
    //и перестанет отвечать на действия пользователя.
    func sceneWillResignActive(_ scene: UIScene) {
        print("sceneWillResignActive - сцена перестанет быть активной")
    }
    
    //Вызывается сразу после перехода приложения в фоновый режим
    //Это происходит при сворачивании приложения свайпом вверх
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("sceneDidEnterBackground - сцена вошла в фоновый режим")
    }
    
    //Вызывается после того, как сцена удаляется из приложения.
    // Дает понять, что приложение было выключено.
    // не вызывается, если приложение было в состоянии приостановлено.
    func sceneDidDisconnect(_ scene: UIScene) {
        print("sceneDidDisconnect - сцена была отключена")
    }

}

