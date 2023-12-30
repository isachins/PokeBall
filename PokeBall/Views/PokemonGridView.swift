//
//  PokemonGridView.swift
//  PokeBall
//
//  Created by Sachin Sharma on 30/12/23.
//

import SwiftUI



struct PokemonGridView: View {
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    ForEach(viewModel.pokemon){
                        pokemon in
                        NavigationLink {
                            PokemonDetailView(viewModel: viewModel, pokemon: pokemon)
                        } label: {
                            PokeCell(pokemon: pokemon, viewModel: viewModel)
                        }
                        //Text("hello")
                    }.padding(.horizontal)
                }.navigationTitle("Pokemon Club \(viewModel.pokemon.count)")
                    //.padding()
                    .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    PokemonGridView()
}
