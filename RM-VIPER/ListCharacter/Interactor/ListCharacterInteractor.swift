//
//  ListCharacterInteractor.swift
//  RM-VIPER
//
//  Created by Hazel Alain on 24/04/24.
//

import Foundation

// Definición de la clase ListCharacterInteractor
class ListCharacterInteractor {
    
    // Método para obtener la lista de personajes
    func fetchCharacters(completion: @escaping ([ListCharacterEntity]?, Error?) -> Void) {
        // Verifica si la URL de la API es válida
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            // Si la URL es inválida, llama al bloque de finalización con un error
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            
            return
        }
        
        // Realiza una solicitud a la URL de la API
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Verifica si se produjo un error durante la solicitud
            if let error = error {
                // Si hay un error, llama al bloque de finalización con el error
                completion(nil, error)
                return
            }
            
            // Verifica si se recibieron datos en la respuesta
            guard let data = data else {
                // Si no hay datos, llama al bloque de finalización con un error
                completion(nil, NSError(domain: "No data", code: 0, userInfo: nil))
                return
            }
            
            do {
                // Inicializa un decodificador JSON
                let decoder = JSONDecoder()
                // Intenta decodificar los datos recibidos en un objeto CharacterResponse
                let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
                // Si la decodificación es exitosa, llama al bloque de finalización con la lista de personajes
                completion(characterResponse.results, nil)
            } catch {
                // Si hay un error durante la decodificación, llama al bloque de finalización con el error
                completion(nil, error)
            }
        }.resume() // Reanuda la tarea de URLSession para iniciar la solicitud
    }
}

