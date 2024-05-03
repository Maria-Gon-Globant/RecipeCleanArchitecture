//
//  RecipeViewModel.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 15/04/24.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    @Published var categoryRecipes: [Recipe] = []
    @Published var topFiveRecipes: [Recipe] = []
    @Published var favorites: [Recipe] = []
    @Published var users: [User] = []
    @Published var searchText: String = ""
    
    var category: String = "All"
    
    private let getRecipesUseCase: GetRecipesUseCase
    private let getFavoritesRecipeUseCase: GetFavoritesUseCase
    private let addFavoriteRecipeUseCase: AddFavoriteUseCase
    private let removeFavoriteRecipeUseCase: RemoveFavoriteUseCase
    private let isFavoriteRecipeUseCase: IsFavoriteUseCase
    private let filteredRecipeUseCase: FilteredRecipeUseCase
    private let categoryRecipesUseCase: CategoryRecipesUseCase
    private let topFiveRecipesUseCase: TopFiveRecipesUseCase
    private let getUserUseCase: GetUserUseCase
    
    private let addRecipeUseCase: AddRecipeUseCase
    private let createRecipeUseCase: CreateRecipeUseCase
    private let getMyRecipesUseCase: GetMyRecipesUseCase
    
    init(getRecipesUseCase: GetRecipesUseCase, getFavoritesRecipeUseCase: GetFavoritesUseCase, addFavoriteRecipeUseCase: AddFavoriteUseCase, removeFavoriteRecipeUseCase: RemoveFavoriteUseCase, isFavoriteRecipeUseCase: IsFavoriteUseCase, filteredRecipeUseCase: FilteredRecipeUseCase, categoryRecipesUseCase: CategoryRecipesUseCase, topFiveRecipesUseCase: TopFiveRecipesUseCase, getUserUseCase: GetUserUseCase, addRecipeUseCase: AddRecipeUseCase, createRecipeUseCase: CreateRecipeUseCase, getMyRecipesUseCase: GetMyRecipesUseCase) {
        self.getRecipesUseCase = getRecipesUseCase
        self.getFavoritesRecipeUseCase = getFavoritesRecipeUseCase
        self.addFavoriteRecipeUseCase = addFavoriteRecipeUseCase
        self.removeFavoriteRecipeUseCase = removeFavoriteRecipeUseCase
        self.isFavoriteRecipeUseCase = isFavoriteRecipeUseCase
        self.filteredRecipeUseCase = filteredRecipeUseCase
        self.categoryRecipesUseCase = categoryRecipesUseCase
        self.topFiveRecipesUseCase = topFiveRecipesUseCase
        self.getUserUseCase = getUserUseCase
        self.addRecipeUseCase = addRecipeUseCase
        self.createRecipeUseCase = createRecipeUseCase
        self.getMyRecipesUseCase = getMyRecipesUseCase
        
        fetchRecipes()
        fetchUsers()
        loadFavorites()
        loadCategoryRecipes(category: category)
        loadTopFiveRecipes(category: category)
    }
    
    func fetchRecipes() {
        recipes = getRecipesUseCase.execute()
    }
    
    func fetchUsers() {
        getUserUseCase.execute { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.users = users
            case .failure(let error):
                print("Error fetching recipes: \(error)")
            }
        }
    }
    
    private func loadFavorites() {
        favorites = getFavoritesRecipeUseCase.execute()
    }
    
    func isFavorite(recipe: Recipe) -> Bool {
        isFavoriteRecipeUseCase.execute(recipe: recipe)
    }
    
    func toggleFavorite(recipe: Recipe) {
        if isFavoriteRecipeUseCase.execute(recipe: recipe) {
            removeFavoriteRecipeUseCase.execute(recipe: recipe)
        } else {
            addFavoriteRecipeUseCase.execute(recipe: recipe)
        }
        loadFavorites()
    }
    
    var filteredRecipe: [Recipe] {
        return filteredRecipeUseCase.execute(searchText: searchText, category: category)
    }
    
    func loadCategoryRecipes(category:String){
        self.category = category
        categoryRecipes = categoryRecipesUseCase.execute(category: category)
    }
    
    func loadTopFiveRecipes(category: String) {
        topFiveRecipes = topFiveRecipesUseCase.execute(category: category)
    }
    
    func addRecipe(name: String, description: String, ingredients: String, steps: String, level: String, portion: String, time: String, image: String, category: String){
        var recipe = createRecipeUseCase.execute(name: name, description: description, ingredients: ingredients, steps: steps, level: level, portion: portion, time: time, image: image, category: category)
        addRecipeUseCase.execute(recipe: recipe)
    }
    
    func getMyRecipes() -> [Recipe] {
        return getMyRecipesUseCase.execute()
    }
}
