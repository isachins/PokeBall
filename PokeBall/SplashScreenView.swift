//
//  SplashScreenView.swift
//  PokeBall
//
//  Created by Sachin Sharma on 30/12/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    @State var isActive: Bool = false
    @State private var size = 0.7
    @State private var opacity = 0.4
    
    var body: some View {
        ZStack{
            if isActive {
                PokemonGridView()
            }
            else {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.pink.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(alignment: .center) {
                        Image("pokeball")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 300, height: 100)
                        Text("Pokemon Club")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.0)) {
                            self.size = 1.4
                            self.opacity = 1.0
                        }
                    }
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation{
                                self.isActive = true
                            }
                        }
                    }
                }
            }
        }.transition(.asymmetric(
            insertion: .move(edge: .bottom),
            removal: .move(edge: .bottom)
        ))
    }
}

#Preview {
    SplashScreenView()
}
