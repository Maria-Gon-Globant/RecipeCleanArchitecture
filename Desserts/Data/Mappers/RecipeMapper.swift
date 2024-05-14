//
//  RecipeMapper.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 25/04/24.
//

import Foundation
extension RecipeDTO {
    func toRecipe() -> Recipe {
        Recipe(
            id: id,
            name: name,
            time: time,
            level: Level(rawValue: level)?.id ?? "",
            portion: portion,
            image: URL(string: image) ?? URL(string: "https://example.com/placeholder.jpg")!,
            description: description,
            ingredients: ingredients,
            steps: steps,
            category: Category(rawValue: category)?.rawValue ?? "",
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
