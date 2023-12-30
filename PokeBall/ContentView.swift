//
//  ContentView.swift
//  PokeBall
//
//  Created by Sachin Sharma on 12/11/23.
//

import SwiftUI
import Shiny

struct ContentView: View {
    var body: some View {
           Text("shiny")
               
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.gray.opacity(0.4))
            .frame(maxWidth: .infinity)
            .frame(height: 250)
            //.shiny(.matte(.offwhite))
            .shiny(.glossy(.offwhite))
            .padding()
       }
    
}

#Preview {
    ContentView()
}
