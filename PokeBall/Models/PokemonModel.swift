//
//  PokemonModel.swift
//  PokeBall
//
//  Created by Sachin Sharma on 30/12/23.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Int
    let height: Int
    let attack: Int
    let defense: Int
    let description: String
}
