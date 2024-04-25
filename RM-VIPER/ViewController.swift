//
//  ViewController.swift
//  RM-VIPER
//
//  Created by Hazel Alain on 23/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ListCharacterInteractor().fetchCharacters { characters, error in
            if let error = error {
                print("Error fetching characters: \(error)")
                return
            }
            
            // Si no hay error, verifica si se obtuvieron los datos de los personajes correctamente
            if let characters = characters {
                // Imprime los nombres de los personajes para verificar que los datos se hayan obtenido correctamente
                for character in characters {
                    print("Name: \(character.name)")
                    print("Status: \(character.status)")
                    print("Species: \(character.species)")
                    print("Image URL: \(character.image)")
                    print("---")
                }
            }
        }
    }
}

