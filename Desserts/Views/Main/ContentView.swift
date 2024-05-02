//
//  ContentView.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 9/04/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    @State var selectedTab = "house"
    var body: some View {
        ZStack{
            switch selectedTab {
            case "house":
                HomeView()
            case "magnifyingglass":
                SearchView()
            case "plus.circle":
                NewRecipeView()
            case "heart":
                FavoritesView()
            case "person":
                ProfileView()
            default:
                HomeView()
            }
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}
