//
//  SecondView.swift
//  PokeNew
//
//  Created by Garrett Butchko on 11/26/24.
//

import SwiftUI

struct IndexView: View {
    
    init (filePath: String, lang: String, name: String){
        thing = Bundle.main.decode(filePath + "index.json")
        self.lang = lang
        self.name = name
    }
    
    var lang: String
    var name: String
    
    var thing: CollectionIndex
    
    var body: some View {
        List {
            
            if name == "pokedex"{
                ForEach(thing.results, id: \.self) { thing in
                    NavigationLink(destination: PokedexView(filePath: thing.url!, lang: lang)) {
                        Text(thing.name?.toNormalCase() ?? "N/A")
                    }
                }
            }
            if name == "itemCategory"{
                ForEach(thing.results, id: \.self) { thing in
                    NavigationLink(destination: ItemCatView(filePath: thing.url!, lang: lang)) {
                        Text(thing.name?.toNormalCase() ?? "N/A")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
