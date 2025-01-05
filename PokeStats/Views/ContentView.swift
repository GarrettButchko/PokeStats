//
//  ContentView.swift
//  PokeNew
//
//  Created by Garrett Butchko on 10/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var pokeAPI = PokemonData()
    var lang: String
        
    init(){
        lang = Locale.current.language.languageCode?.identifier ?? "Unknown"
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(pokeAPI.apiLocations, id: \.name) { location in
                    if location.name == "pokedex" {
                        NavigationLink(destination: IndexView(filePath: location.url, lang: lang)) {
                            Text(location.name.toNormalCase())
                        }
                    }
                }
            }
            .navigationTitle("Pokedex's")
        }
        .tint(Color.primary)
    }
}

#Preview {
    ContentView()
}
