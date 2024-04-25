//
//  ListCharacterInteractor.swift
//  RM-VIPER
//
//  Created by Hazel Alain on 24/04/24.
//

import Foundation


class ListCharacterInteractor {
    func fetchCharacters(completion: @escaping ([ListCharacterEntity]?, Error?) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "No data", code: 0, userInfo: nil))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let characterResponse = try decoder.decode(CharacterResponse.self, from: data)
                completion(characterResponse.results, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}
