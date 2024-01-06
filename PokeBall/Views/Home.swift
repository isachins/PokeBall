//
//  Home.swift
//  PokeBall
//
//  Created by Sachin Sharma on 06/01/24.
//

import SwiftUI

struct Home: View {
    @State private var selectedView = 0 // Control variable for Picker
    let views = ["Tile View", "Grid View"] // Titles for Picker options
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Picker(selection: $selectedView, label: Text("Select a view")) {
                        ForEach(0..<views.count, id: \.self) { index in
                            Text(self.views[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    
                    ScrollView {
                        if selectedView == 0 {
                            ForEach(viewModel.pokemon){
                                pokemon in
                                NavigationLink {
                                    PokemonDetailView(viewModel: viewModel, pokemon: pokemon)
                                } label: {
                                    PokeCellTile(pokemon: pokemon, viewModel: viewModel)
                                    
                                }
                            }
                            
                        }
                        else {
                            LazyVGrid(columns: gridItems, spacing: 16) {
                                ForEach(viewModel.pokemon){
                                    pokemon in
                                    NavigationLink {
                                        PokemonDetailView(viewModel: viewModel, pokemon: pokemon)
                                    } label: {
                                        PokeCellGrid(pokemon: pokemon, viewModel: viewModel)
                                    }
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                   
                }
                .padding(5)
                .navigationTitle("Pokemon Club \(viewModel.pokemon.count)")
            }
        }
    }
}

#Preview {
    Home()
}
