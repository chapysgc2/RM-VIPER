//
//  SceneDelegate.swift
//  RM-VIPER
//
//  Created by Hazel Alain on 23/04/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var listCharacterRouter = ListCharacterRouter() //agregamos esta propiedad

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        listCharacterRouter.showListCharacters(window: window)
    }


}
