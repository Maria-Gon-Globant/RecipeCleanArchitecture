//
//  Common.swift
//  Desserts
//
//  Created by Maria Paula  on 4/23/24.
//

import Foundation
import SwiftUI
extension Color {
    init(hex: Int, opacity: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: opacity
        )
    }
}

extension Double {
    func round(num: Int) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = num
        formatter.roundingMode = .down
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}

enum JsonFiles: String {
    var id: String { return self.rawValue }
    
    case Favorites = "favorites.json"
    case Recipe = "recipe.json"
    case MyRecipes = "myRecipes.json"
    case Users = "users.json"
}

enum JsonKeys: String {
    var id: String { return self.rawValue }
    
    case Favorites = "favorites"
    case Recipe = "recipes"
    case MyRecipes = "myRecipes"
    case Users = "users"
}

enum ErrorString: String {
    var id: String { return self.rawValue }
    
    case Name = "Invalid name, the recipe name must be greater than 5 and less than 50 characters"
    case Portion = "Number of invalid portions, must be a positive number greater than 0 less than 20"
    case Time = "Invalid time, the duration of the recipe must be a positive number greater than 0 less than 300 mins"
    case Image =  "Invalid URL, the recipe URL must be greater than 5 and less than 200 characters"
    case Description = "Invalid description, the recipe description must be greater than 5 and less than 200 characters"
    case Steps = "Invalid steps, the recipe steps must be greater than 5 characters, less than 1000 characters and must be separated by a line break"
    case Ingredients = "Invalid ingredients, the recipe ingredients must be greater than 5 characters, less than 1000 characters and must be separated by a line break"
}
