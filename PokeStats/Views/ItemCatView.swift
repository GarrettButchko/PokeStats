//
//  ItemCatView.swift
//  PokeStats
//
//  Created by Garrett Butchko on 1/7/25.
//

import SwiftUI

struct ItemCatView: View {
    @State private var searchText: String = ""
    private let filePath: String
    private let lang: String

    init(filePath: String, lang: String) {
        self.lang = lang
        self.filePath = filePath
    }
    
    private var itemCat: ItemCategory {
        return Bundle.main.decode(filePath + "index.json")
    }

    // Filtered Pokemon entries based on search text
    private var filteredItems: [GenerationElement] {
        if searchText.isEmpty {
            return itemCat.items!
        } else {
            return itemCat.items!.filter {
                $0.name!.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        List {
            ItemListView(filteredItems: filteredItems, lang: lang)
        }
        .searchable(text: $searchText, placement: .automatic)
        .navigationBarTitle(itemCat.name?.toUniversalNormalCase() ?? "Error")
    }
}


#Preview {
    ContentView()
}

struct ItemListView: View {
    
    var filteredItems: [GenerationElement]
    let lang: String
    
    private var decodedItems: [Item] {
        filteredItems.compactMap { filteredItem in
            guard let url = filteredItem.url else { return nil }
            return Bundle.main.decode(url + "index.json")
        }
    }
    
    var body: some View {
        Section(header: Text("Items")) {
            ForEach(decodedItems, id: \.self) { item in
               // NavigationLink(destination: PokeView(filePath: pokemonEntry.pokemonSpecies.url!, lang: lang)) {
                    
                    HStack {
                        
                        Text(item.name?.toUniversalNormalCase() ?? "")
                        
                        Spacer()
                        
                        AsyncImage(url: URL(string: item.sprites?.spritesDefault ?? "")) { image in
                            image
                                .resizable()
                               .frame(width: 39, height: 39)
                        } placeholder: {
                            Text("")
                                .frame(width: 39, height: 39)
                        }
                    
                    }
                //}
            }
        }
    }
}
