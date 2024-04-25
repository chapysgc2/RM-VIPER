//
//  ListCharacterPresenter.swift
//  RM-VIPER
//
//  Created by Hazel Alain on 25/04/24.
//

import Foundation

protocol ListCharacterUI : AnyObject {
    
    func update(characters :  [ListCharacterEntity])
}


class ListCharacterPresenter{
    
    // Referencia débil a la vista que implementa el protocolo listCharacterUI
    var ui : ListCharacterUI?
    
    // Instancia del interactor que se utilizará para obtener la lista de personajes
    private var listCharacterInteractor = ListCharacterInteractor()
    
    init(listCharacterInteractor : ListCharacterInteractor) {
        self.listCharacterInteractor = listCharacterInteractor
    
    }
    
    func onViewAppear() {
           listCharacterInteractor.fetchCharacters { [weak self] characters, error in
               if let error = error {
                   print("Error fetching characters: \(error)")
               } else if let characters = characters {
                   self?.ui?.update(characters: characters)
               }
           }
       }
}
