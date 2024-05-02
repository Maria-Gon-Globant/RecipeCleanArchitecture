//
//  SearchView.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 22/04/24.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    @State var selectedCategory = "All"
    
    var body: some View {
        NavigationStack {
            ScrollView{
                ScrollView(.horizontal){
                    HStack(alignment:.center, spacing: 10){
                        ButtonCategory(selectedCategory: $selectedCategory, categoryText: "All")
                        ForEach(Category.allCases) {
                            category in
                            ButtonCategory(selectedCategory: $selectedCategory, categoryText: category.id)
                        }
                    }
                }.padding()
                    
                Text("Top 5")
                    .bold()
                    .font(.title)
                    .foregroundStyle(Color(hex: 0x070B9BE))
                    .padding(.bottom, -20)
                    .padding(.leading, -150)
                ScrollView(.horizontal){
                    LazyHStack{
                        ForEach(recipesVM.topFiveRecipes){
                            recipe in
                            NavigationLink(destination: RecipeView(recipe: recipe)){
                                RecipeImageCard(recipe: recipe)
                            }
                        }
                    }
                    .padding()
                }
                .frame(height: 250)
                
                Section{
                    LazyVStack(alignment: .leading, spacing: 10) {
                        ForEach(recipesVM.filteredRecipe) { recipe in
                            NavigationLink(destination: RecipeView(recipe: recipe)
                            ) {
                                RecipeCardH(recipe: recipe)
                            }.foregroundStyle(Color(.black))
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: recipesVM.filteredRecipe.count)
                    .navigationTitle("Search")
                    .navigationBarTitleDisplayMode(.inline)
                } header: {
                    Text("Recipes")
                        .bold()
                        .font(.title)
                        .foregroundStyle(Color(hex: 0x070B9BE))
                }
            }
            .searchable(text: $recipesVM.searchText)
            
            Spacer(minLength: 100)
        }
    }
}
