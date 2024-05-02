//
//  RecipeCard.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 12/04/24.
//

import SwiftUI

struct RecipeCardV: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    let recipe: Recipe
    var body: some View {
        VStack(alignment: .leading){
            AsyncImage(url: recipe.image) {
                image in
                image 
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Text(recipe.name)
                .bold()
            Spacer()
            HStack {
                Image(systemName: "clock")
                Text(recipe.time)
                Spacer()
                Image(systemName: "chart.bar")
                Text(recipe.level)
                Spacer()
                Image(systemName: "fork.knife")
                Text(recipe.portion)
            }.opacity(0.6)
            
        }.padding()
            .frame(minWidth: 100, maxWidth: 325 ,minHeight: 200, maxHeight: 385)
            .background(Color(.white))
            .cornerRadius(12)
            .shadow(radius: 10)
    }
}
