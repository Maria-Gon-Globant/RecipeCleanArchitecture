//
//  DessertsApp.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 9/04/24.
//

import SwiftUI

@main
struct DessertsApp: App {
    var favoriteRepository = LocalFavoriteRepository()
    var recipeRepository = LocalRecipeRepository()
    var userRespository = LocalUserRepository()
    @StateObject var recipeViewModel: RecipeViewModel
    
    init() {
        let getRecipesUseCase = DefaultGetRecipesUseCase(recipeRepository: recipeRepository)
        let getFavoritesUseCase = DefaultGetFavoriteUseCase(repository: favoriteRepository)
        let addFavoriteRecipeUseCase = DefaultAddFavoriteUseCase(repository: favoriteRepository)
        let removeFavoriteRecipeUseCase = DefaultRemoveFavoriteUseCase(repository: favoriteRepository)
        let isFavoriteRecipeUseCase = DefaultIsFavoriteUseCase(repository: favoriteRepository)
        let categoryRecipesUseCase = DefaultCategoryRecipesUseCase(getRecipesUseCase: getRecipesUseCase)
        let filteredRecipeUseCase = DefaultFilteredRecipeUseCase(categoryRecipes: categoryRecipesUseCase)
        let topFiveRecipesUseCase = DefaultTopFiveRecipesUseCase(categoryRecipes: categoryRecipesUseCase)
        let getUserUseCase = DefaultGetUserUseCase(userRepository: userRespository)
        let getMyRecipeUseCase = DefaultGetMyRecipesUseCase(repository: recipeRepository)
        let addRecipeUseCase = DefaultAddRecipeUseCase(repository: recipeRepository)
        let createRecipeUseCase = DefaultCreateRecipeUseCase()
         
        let viewModel = RecipeViewModel(
            getRecipesUseCase: getRecipesUseCase,
            getFavoritesRecipeUseCase: getFavoritesUseCase,
            addFavoriteRecipeUseCase: addFavoriteRecipeUseCase,
            removeFavoriteRecipeUseCase: removeFavoriteRecipeUseCase,
            isFavoriteRecipeUseCase: isFavoriteRecipeUseCase, 
            filteredRecipeUseCase: filteredRecipeUseCase,
            categoryRecipesUseCase: categoryRecipesUseCase, 
            topFiveRecipesUseCase: topFiveRecipesUseCase,
            getUserUseCase: getUserUseCase,
            addRecipeUseCase:addRecipeUseCase,
            createRecipeUseCase: createRecipeUseCase,
            getMyRecipesUseCase: getMyRecipeUseCase
        )
        
        _recipeViewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(recipeViewModel)
        }
    }
}
