//
//  DescriptionView.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 30/04/24.
//

import SwiftUI

struct DescriptionView: View {
    @EnvironmentObject var recipesVM: RecipeViewModel
    @State var isActive = false
    let recipe: Recipe
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text(recipe.name)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 4){
                    ForEach(0 ..< Int(recipe.rate)) { _ in
                        Image("star")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25)
                    }
                    
                    Text("\(recipe.rate.round(num: 2))")
                        .padding(.leading, 8)
                    Spacer()
                    
                    Text(recipe.time)
                }
                
                Text("Description")
                    .foregroundStyle(Color(hex: 0x070B9BE))
                    .font(.system(size: 25))
                    .bold()
                    .fontWeight(.medium)
                    .padding(.vertical, 8)
                
                Text(recipe.description)
                    .opacity(0.8)
                    .lineSpacing(8)
                    .padding(.leading, 8)
            }
            
            VStack(alignment: .center){
                Toggle("", isOn: $isActive)
                    .toggleStyle(CustomToggleStyle())
                    .padding()
            }
            
            VStack(alignment: .leading){
                ForEach(isActive ? recipe.steps : recipe.ingredients, id: \.self) {
                    str in
                    Text("O  " + str)
                    
                }.multilineTextAlignment(.leading)
                    .padding(.vertical, 5)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
            }
            
            Spacer(minLength: 50)
            
        }.padding()
            .padding(.top)
            .background(Color(.white))
            .cornerRadius(40)
    }
}
