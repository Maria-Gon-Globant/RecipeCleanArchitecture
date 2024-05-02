//
//  RecipeView.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 15/04/24.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    @Environment(\.dismiss) var dismiss
    let recipe: Recipe
    var body: some View {
        ScrollView{
            AsyncImage(url: recipe.image) {
                image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                    
            } placeholder: {
                ProgressView()
            }.background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.gray]), startPoint: .top, endPoint: .bottom))
            DescriptionView(recipe: recipe)
                .offset(y: -40)
        }.ignoresSafeArea(.container, edges: .top)
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .padding(.all,12)
                            .background(Color(.white))
                            .cornerRadius(8)
                            .foregroundStyle(Color(hex: 0x070B9BE))
                    })
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        recipesVM.toggleFavorite(recipe: recipe)
                    }, label: {
                        Image(systemName: recipesVM.isFavorite( recipe: recipe) ? "heart.fill": "heart")
                            .padding(.all,12)
                            .background(Color(.white))
                            .cornerRadius(8)
                            .foregroundStyle(Color(hex: 0x070B9BE))
                    })
                }
            }
    }
}
