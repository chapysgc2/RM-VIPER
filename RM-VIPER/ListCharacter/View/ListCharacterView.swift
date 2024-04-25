//
//  ListCharacterView.swift
//  RM-VIPER
//
//  Created by Hazel Alain on 25/04/24.
//
import Foundation
import UIKit

class ListCharacterView: UIViewController, ListCharacterUI {
    var presenter: ListCharacterPresenter

    init(presenter: ListCharacterPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Configuración de la interfaz de usuario y otras inicializaciones necesarias
        presenter.onViewAppear() // Solicitar al presentador que cargue los personajes al aparecer la vista
    }

    // Implementación del método update del protocolo ListCharacterUI
    func update(characters: [ListCharacterEntity]) {
        // Imprimir los nombres de los personajes en la consola
        print("traido desde el presenter")
        for character in characters {
            
            print("Name: \(character.name)")
        }
    }
}




