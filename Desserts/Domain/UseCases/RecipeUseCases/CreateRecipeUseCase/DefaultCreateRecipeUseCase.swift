//
//  DefaultCreateRecipeUseCase.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import Foundation
class DefaultCreateRecipeUseCase: CreateRecipeUseCase {
    func createRecipe(name: String, description: String, ingredients: String, steps: String, level: String, portion: String, time: String, image: String, category: String) -> Recipe {
        
        return Recipe(id: name, name: name, time: time + " mins", level: level, portion: portion + "porions", image: URL(string: image) ?? URL(string: "https://example.com/placeholder.jpg")!, description: description, ingredients: toList(str: ingredients), steps: toList(str: steps), category: category, rate: 0.0)
    }
    
    private func toList(str: String) -> [String]{
        return str.components(separatedBy: "\n")
    }

}
