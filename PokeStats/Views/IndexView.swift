//
//  SecondView.swift
//  PokeNew
//
//  Created by Garrett Butchko on 11/26/24.
//

import SwiftUI

struct IndexView: View {
    
    init (filePath: String, lang: String){
        thing = Bundle.main.decode(filePath + "index.json")
        self.lang = lang
        
    }
    
    var lang: String
    
    var thing: CollectionIndex
    
    
    
    var body: some View {
        List {
            ForEach(thing.results, id: \.name) { thing in
                NavigationLink(destination: PokedexView(filePath: thing.url!, lang: lang)) {
                    Text(thing.name?.toNormalCase() ?? "N/A")
                    }
                }
            }
        }
    
    
}

#Preview {
    ContentView()
}
