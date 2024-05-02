//
//  RecipeImageCard.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 30/04/24.
//

import SwiftUI

struct RecipeImageCard: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    let recipe: Recipe
    var body: some View {
        AsyncImage(url: recipe.image) {
            image in
            image
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                .overlay(alignment: .bottomLeading, content: {
                    Text(recipe.name)
                        .bold()
                        .foregroundStyle(Color(.white))
                        .shadow(radius: 10)
                        .padding(.all, 10)
                }).padding(.all, 10)
        } placeholder: {
            ProgressView()
        }

    }
}
