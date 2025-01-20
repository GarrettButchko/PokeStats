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
                    if location.name == "pokedex" || location.name == "itemCategory" {
                            NavigationLink(destination: IndexView(filePath: location.url, lang: lang, name: location.name)) {
                                Text(location.name.toUniversalNormalCase() + "'s")
                            }
                        }
                }
            }
            .navigationTitle("PokeStats")
        }
        .tint(Color.primary)
    }
}

#Preview {
    ContentView()
}
