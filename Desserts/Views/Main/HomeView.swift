//
//  HomeView.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 12/04/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    let gridItems = [GridItem(.flexible())]
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 30, content: {
                    ForEach(recipesVM.recipes, id: \.self) { recipe in
                        
                        NavigationLink(destination: RecipeView(recipe: recipe)) {
                            RecipeCardV(recipe: recipe)
                                .foregroundStyle(Color(.black))
                        }
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                })
            }
            .navigationTitle("Home")
        }
    }
}
