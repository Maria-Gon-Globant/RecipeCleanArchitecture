//
//  RecipeEntity.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
enum Category: String, CaseIterable, Identifiable {
    var id: String { return self.rawValue }
    
    case breakfast = "Breakfast"
    case vegan = "Vegan"
    case soup = "Soup"
    case salad = "Salad"
    case appetizer = "Appetizer"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case snack = "Snack"
    case drink = "Drink"
}

enum Level: String, CaseIterable, Identifiable {
    var id: String { return self.rawValue }
    
    case easy = "Easy"
    case medium = "Medium"
    case difficult = "Difficult"
}

struct Recipe: Identifiable, Hashable {
    var id : String
    var name: String
    var time: String
    var level: Level.ID
    var portion: String
    
    var image: URL
    var description: String
    var ingredients: [String]
    var steps: [String]
    var category: Category.ID
    var rate: Double
    
    //var datePublished: Date
    //var creator: User.ID
}
