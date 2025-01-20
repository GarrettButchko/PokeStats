//
//  Untitled.swift
//  PokeNew
//
//  Created by Garrett Butchko on 11/26/24.
//

import Foundation

extension String {
    /// Converts a dashed string to a "Normal" format with spaces and capitalization.
    func toNormalCase() -> String {
        self.split(separator: "-") // Split by dashes
            .map { $0.capitalized } // Capitalize each word
            .joined(separator: " ") // Join with spaces
    }
    
    /// Removes line breaks and form feed characters, joining with spaces.
    func withoutLineBreak() -> String {
        self.split { $0 == "\n" || $0 == "\u{000C}" } // Use Unicode for form feed
            .joined(separator: " ") // Join with spaces
    }
    
    /// Converts a camelCase string to "Normal" format with spaces and capitalization.
    func fromCamelCase() -> String {
        self.unicodeScalars.reduce("") { result, scalar in
            if CharacterSet.uppercaseLetters.contains(scalar) {
                return result + " " + String(scalar) // Add a space before uppercase letters
            } else {
                return result + String(scalar)
            }
        }
        .capitalized // Capitalize each word
    }
    
    /// Detects if the string is in camelCase or dashed format and converts it to "Normal" format.
    func toUniversalNormalCase() -> String {
        if self.contains("-") {
            return self.toNormalCase()
        } else {
            return self.fromCamelCase()
        }
    }
}
