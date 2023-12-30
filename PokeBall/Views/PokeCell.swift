//
//  PokeCell.swift
//  PokeBall
//
//  Created by Sachin Sharma on 16/11/23.
//

import SwiftUI
import Kingfisher
import Shiny

let samplePoke = Pokemon(id: 1, name: "test", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "fire", weight: 10, height: 10, attack: 10, defense: 10, description: "test another one")

let sampleVM = PokemonViewModel()

struct PokeCell: View {
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    
    var body: some View {
        ZStack {
            
            VStack(alignment: .center) {
                //MARK: - Install a package named kingfisher to add url image from internet to our project and perform functions
                                    
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding([.bottom,.trailing], 4)
                
//                Ellipse()
//                    .fill(Color.black.opacity(0.2))
//                    .frame(width: 110, height: 20)
//                    .padding()
                
                HStack {
                    //pokemon Name
                    Text(pokemon.name.capitalized)
                        .font(.system(size: 25, weight:.bold, design: .default))
                        .foregroundColor(.black)
                        .padding(.top, 5)
                        .padding(.leading)
                    
                    Spacer()
                    //Pokemon type
                    Text(pokemon.type.capitalized)
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white.opacity(0.2))
                        )
                        .frame(width: 100, height: 24)
                    
                    
                    
                }
            }.padding(20)
        }
        // each cared's background and design
        .background(Color(viewModel.backgroundColor(forType: pokemon.type)).opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.all, 6)
            .clipShape(RoundedRectangle(cornerRadius: 30))
            .shadow(color: .black.opacity(0.4), radius: 8, x: 8, y: 8)
            .shadow(color: .white.opacity(0.2), radius: 10, x: -10, y: -10)
            .shiny(.glossy(.offwhite))
          
      
       
    }
}

#Preview {
    PokeCell(pokemon: samplePoke, viewModel: sampleVM)
}
