//
//  RecipeCardH.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 30/04/24.
//

import SwiftUI

struct RecipeCardH: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    let recipe: Recipe
    var body: some View {
        HStack(alignment: .top, spacing: 10){
            AsyncImage(url: recipe.image) {
                image in
                image
                    .resizable()
                    .frame(width: 100,height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 5)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment:.leading, spacing: 5){
                Text(recipe.name)
                Text(recipe.description)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
            }
            .padding(.trailing, 10)
            .padding(.vertical, 5)
        }.padding(.all, 15)
    }
}

