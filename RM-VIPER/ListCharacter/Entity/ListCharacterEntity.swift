//
//  ListCharacterEntity.swift
//  RM-VIPER
//
//  Created by Hazel Alain on 24/04/24.
//

import Foundation

struct ListCharacterEntity : Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}
