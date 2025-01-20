//
//  PokemonNames.swift
//  Pokedex
//
//  Created by Garrett Butchko on 10/18/24.
//

import Foundation
import SwiftUI
import Combine

class PokemonData: ObservableObject {
    
    @Published var apiIndex: APIIndex?
    
    var apiLocations: [(name: String, url: String)] = []
    
    init() {
        // Assuming `apiIndex` is already decoded correctly
        apiIndex = Bundle.main.decode("/api/v2/index.json")

        // Use Mirror reflection to loop through the properties of `apiIndex`
        if let apiIndex = apiIndex {
            let mirror = Mirror(reflecting: apiIndex)
            for child in mirror.children {
                if let propertyName = child.label, let url = child.value as? String {
                    // Add the property name and its URL to the list
                    apiLocations.append((name: propertyName, url: url))
                }
            }
        }
    }
}

