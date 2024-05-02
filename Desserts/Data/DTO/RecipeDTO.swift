//
//  RecipeDTO.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation

struct RecipeDTO: Codable {
    let id : String
    let name: String
    let time: String
    let level: String
    let portion: String
    
    let image: String
    let description: String
    let ingredients: [String]
    let steps: [String]
    let category: String
    let rate: Double
    
    //let date: String
    //let creator: Int
}

struct RecipesContainerDTO: Decodable {
    let recipes: [RecipeDTO]
}
