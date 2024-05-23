//
//  RecipeMapper.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
extension RecipeDTO {
    func toRecipe() -> Recipe {
        let level = Level(rawValue: level)?.id ?? ""
        let image = URL(string: image) ?? URL(string: "https://example.com/placeholder.jpg")!
        let category = Category(rawValue: category)?.rawValue ?? ""
        
        return Recipe(
            id: id,
            name: name,
            time: time,
            level: level,
            portion: portion,
            image: image,
            description: description,
            ingredients: ingredients,
            steps: steps,
            category: category,
            rate: rate
        )
    }
}

extension Recipe {
    func toRecipeDTO() -> RecipeDTO {
        RecipeDTO(
            id: self.id,
            name: self.name,
            time: self.time,
            level: self.level,
            portion: self.portion,
            image: self.image.absoluteString,
            description: self.description,
            ingredients: self.ingredients,
            steps: self.steps,
            category: self.category,
            rate: self.rate
        )
    }
}
