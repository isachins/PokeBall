//
//  PokemonDetailView.swift
//  PokeBall
//
//  Created by Sachin Sharma on 30/12/23.
//

import SwiftUI
import Kingfisher

let sampleNPoke = Pokemon(id: 1, name: "test", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "fire", weight: 10, height: 10, attack: 10, defense: 10, description: "Bulbasaur can be seen napping in bright sunlight.\nThere is a seed on its back. By soaking up the sun’s rays,\nthe seed grows progressively larger.")

let sampleNVM = PokemonViewModel()

struct PokemonDetailView: View {
    
    let viewModel: PokemonViewModel
    let pokemon: Pokemon
    
    var body: some View {
        ZStack {
            VStack() {
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding([.trailing], 4)
                Ellipse()
                    .fill(Color.black.opacity(0.2))
                    .frame(width: 150, height: 20)
                    .padding()
                
                
                VStack(alignment: .leading) {
                    Text("About")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                    
                    HStack() {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .overlay {
                                VStack {
                                    Image("bolt")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        .padding(5)
                                    Text("Attack")
                                        .foregroundStyle(.gray)
                                        .font(.callout)
                                        .fontWeight(.medium)
                                    //Text(pokemon.attack)
                                    Text("\(pokemon.attack)")
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .overlay {
                                VStack {
                                    Image("shield")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        .padding(5)
                                    Text("Defense")
                                        .foregroundStyle(.gray)
                                        .font(.callout)
                                        .fontWeight(.medium)
                                    Text("\(pokemon.defense)")
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .overlay {
                                VStack {
                                    Image("height")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        .padding(5)
                                    Text("Height")
                                        .foregroundStyle(.gray)
                                        .font(.callout)
                                        .fontWeight(.medium)
                                    Text("\(pokemon.height)")
                                }
                            }
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .overlay {
                                VStack {
                                    Image("weight")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 30, height: 30)
                                        .padding(5)
                                    Text("Weight")
                                        .foregroundStyle(.gray)
                                        .font(.callout)
                                        .fontWeight(.medium)
                                    Text("\(pokemon.weight)")
                                }
                            }
                    }
                    .frame(height: 100)
                    .font(.headline)
                    
                    
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .overlay (
                            VStack(alignment: .center) {
                                Text("Description")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.vertical, 10)
                                Divider()
                                
                                Text("\(pokemon.description)")
                                    .fontWeight(.medium)
                                    .foregroundStyle(Color.gray)
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    
                                Spacer()
                                
                            }
                            , alignment: .center
                        )
                }
                
                
                
                
                
                
                
            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(viewModel.backgroundColor(forType: pokemon.type)).opacity(0.3))
        .navigationTitle("\(pokemon.name.capitalized)").navigationBarTitleDisplayMode(.inline)
    }
}



#Preview {
    PokemonDetailView(viewModel: sampleNVM, pokemon: sampleNPoke)
}
