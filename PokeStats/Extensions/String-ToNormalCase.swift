//
//  Untitled.swift
//  PokeNew
//
//  Created by Garrett Butchko on 11/26/24.
//

extension String {
    /// Converts a dashed string to a "Normal" format with spaces and capitalization.
    func toNormalCase() -> String {
        self.split(separator: "-") // Split by dashes
            .map { $0.capitalized } // Capitalize each word
            .joined(separator: " ") // Join with spaces
    }
    
    func withoutLineBreak() -> String {
        self.split { $0 == "\n" || $0 == "\u{000C}" } // Use Unicode for form feed
            .joined(separator: " ") // Join with spaces
    }
    
    
}
