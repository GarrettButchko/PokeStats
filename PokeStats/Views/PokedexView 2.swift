//
//  SecondView.swift
//  PokeNew
//
//  Created by Garrett Butchko on 11/26/24.
//

import SwiftUI

struct PokedexView: View {
    @State private var searchText: String = ""
    private let pokedex: Pokedex
    private let lang: String

    init(filePath: String, lang: String) {
        pokedex = Bundle.main.decode(filePath + "index.json")
        self.lang = lang
    }

    // Filtered Pokemon entries based on search text
    private var filteredPokemonEntries: [PokemonEntry] {
        if searchText.isEmpty {
            return pokedex.pokemonEntries
        } else {
            return pokedex.pokemonEntries.filter {
                $0.pokemonSpecies.name!.toNormalCase().localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        List {
            Section {
                ForEach(pokedex.descriptions!, id: \.self) { descrip in
                    if descrip.language.name == lang && !descrip.description.isEmpty {
                        Text("Description: \(descrip.description)")
                    }
                }
                if let region = pokedex.region {
                    Text("Region: \(region.name?.toNormalCase() ?? "Error")")
                }
            }
            PokemonListView(filteredPokemonEntries: filteredPokemonEntries, lang: lang)
        }
        .searchable(text: $searchText, placement: .automatic)
        .navigationBarTitle(pokedex.name!.toNormalCase())
    }
}


#Preview {
    ContentView()
}

struct PokemonListView: View {
    
    var filteredPokemonEntries: [PokemonEntry]
    let lang: String
    
    var body: some View {
        Section(header: Text("Pokemon")) {
            ForEach(filteredPokemonEntries, id: \.entryNumber) { pokemonEntry in
                NavigationLink(destination: PokeView(filePath: pokemonEntry.pokemonSpecies.url!, lang: lang)) {
                    
                    let pokemonSpeciesUrl = pokemonEntry.pokemonSpecies.url!
                    let number = pokemonSpeciesUrl.firstIndex(of: "s")
                    let endNum = pokemonSpeciesUrl.index(number!, offsetBy: 7)
                    let fileNumber = pokemonSpeciesUrl[endNum...]
                    
                    
                    let pokemon1: PokemonForm = Bundle.main.decode("api/v2/pokemon-form" + fileNumber + "index.json")
                    
                    HStack {
                        Text("\(pokemonEntry.entryNumber)")
                        
                        Text(pokemonEntry.pokemonSpecies.name?.toNormalCase() ?? "N/A")
                        
                        Spacer()
                        
                        VStack {
                            ForEach(pokemon1.types, id: \.self) { types in
                                Image(types.type?.name ?? "Grass")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                        
                        
                        Image(String(URL(fileURLWithPath: (pokemon1.sprites?.frontDefault!)!).lastPathComponent.dropLast(4)))
                            .resizable()
                            .frame(width: 40, height: 40)
                        
                       
                    }
                }
            }
        }
    }
}
