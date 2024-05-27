//
//  ProfileView.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 12/04/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    var body: some View {
        NavigationStack{
            VStack{
                Image("user")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150)
                    .padding(.vertical, 50)
                    .clipShape(Circle())
            }.frame(width: 400, alignment: .top)
                .background(Color(hex: 0x070B9BE))
                .clipShape(CustomCurve())
            Spacer()
            Text(recipesVM.users[0].name)
                .bold()
                .font(.title)
            Spacer()
            HStack(spacing: 25){
                VStack{
                    Text("\(recipesVM.myRecipes.count)")
                    Text("Recipes")
                }
                VStack{
                    Text("\(4.5.round(num: 2))")
                    Text("Stars")
                }
                VStack{
                    Text("\(recipesVM.favorites.count)")
                    Text("Favorites")
                }
            }.padding(.bottom, 50)
            
            Section{
                ScrollView{
                    LazyVStack{
                        ForEach(recipesVM.myRecipes) {
                            recipe in
                            NavigationLink(destination: {RecipeView(recipe: recipe)}, label: {
                                RecipeCardH(recipe: recipe)
                                    .foregroundStyle(Color(.black))
                            })
                        }
                    }
                    Spacer(minLength: 100)
                }
            } header: {
                Text("My recipes")
                    .foregroundStyle(Color(hex: 0x070B9BE))
                    .font(.title)
                    .bold()
                    .padding(.leading, -150.0)
            }
        }
        
    }
}
