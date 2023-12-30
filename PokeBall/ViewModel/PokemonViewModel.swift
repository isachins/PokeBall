//
//  PokemonViewModel.swift
//  PokeBall
//
//  Created by Sachin Sharma on 30/12/23.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
    
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchData()
        print(pokemon)
    }
    
    func fetchData(){
        guard let url = URL(string: baseUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            
            //more code here
            guard let data = data?.parseData(removeString: "null,") else {
                return
            }
            
            
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else{
                return
            }
            
            //store this data
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .orange
        case "poison": return .purple
        case "water": return .blue
        case "electric": return .yellow
        case "psychic": return .brown
        case "normal": return .magenta
        case "ground": return .green
        case "flying": return .cyan
        case "fairy": return .systemTeal
        default: return .systemPink
            
        }
    }
    
}


extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        guard let data = parsedDataString?.data(using: .utf8) else {
            return nil
        }
        return data
        
    }
}
