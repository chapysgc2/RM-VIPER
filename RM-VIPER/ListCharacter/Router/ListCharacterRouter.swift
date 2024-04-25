//
//  ListCharacterRouter.swift
//  RM-VIPER
//
//  Created by Hazel Alain on 25/04/24.
//

import Foundation
import UIKit

class ListCharacterRouter {
    
    func showListCharacters(window: UIWindow?) {
        let interactor = ListCharacterInteractor()
        let presenter = ListCharacterPresenter(listCharacterInteractor: interactor)
        
        let view = ListCharacterView(presenter: presenter)
        presenter.ui = view
        view.presenter = presenter
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}

