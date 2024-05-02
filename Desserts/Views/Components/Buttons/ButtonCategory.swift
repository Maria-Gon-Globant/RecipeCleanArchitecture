//
//  ButtonCategory.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 30/04/24.
//

import SwiftUI

struct ButtonCategory: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    @Binding var selectedCategory: String
    var categoryText: String
    var body: some View {
        Button(action: {
            selectedCategory = categoryText
            recipesVM.loadCategoryRecipes(category: selectedCategory)
            recipesVM.loadTopFiveRecipes(category: selectedCategory)
        }, label: {
            Text(categoryText)
                .foregroundStyle(selectedCategory == categoryText ? Color(.white) : Color(.black))
                .padding(.horizontal, 10)
        }).frame(minWidth: 100, minHeight: 50)
            .background(selectedCategory == categoryText ? Color(hex: 0x070B9BE) : Color(hex: 0x0f1f5f5))
            .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}
