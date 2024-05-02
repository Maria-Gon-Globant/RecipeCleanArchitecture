//
//  NewRecipeView.swift
//  Desserts
//
//  Created by Maria Paula Gonzalez Escallon on 2/05/24.
//

import SwiftUI

struct NewRecipeView: View {
    @State var name: String = ""
    @State var description: String = ""
    @State var ingredients: String = ""
    @State var steps: String = ""
    @State var level: String = ""
    @State var portion: String = ""
    @State var time: String = ""
    @State var image: String = ""
    @State var category: String = ""
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Recipe name", text: $name)
                        .textContentType(.name)
                    TextField("Recipe level", text: $level)
                    TextField("Number of portions", text: $portion)
                        .keyboardType(.numberPad)
                    TextField("Recipe duration (minutes)", text: $time)
                        .keyboardType(.numberPad)
                    TextField("Image URL", text: $image)
                        .textContentType(.URL)
                    Picker("Category", selection: $category){
                        ForEach(Category.allCases) {
                            category in
                            Text(category.id.uppercased())
                                .tag(category)
                        }
                    }
                }header: {
                    Text(" ")
                }
                Section{
                    TextEditor(text: $description)
                }header: {
                    Text("Description")
                }
                Section{
                    TextEditor(text: $ingredients)
                }header: {
                    Text("Ingredients")
                }
                Section{
                    TextEditor(text: $steps)
                }header: {
                    Text("Steps")
                }
                Section{
                    Button(action: {
                        print(category)
                    }, label: {
                        Text("Create recipe")
                            .bold()
                    })
                    .frame(minWidth: 300)
                    .disabled(name.isEmpty)
                    .padding()
                        
                }.listRowBackground(Color(hex: 0x070B9BE))
                    .foregroundStyle(Color(.white))
                Spacer()
                    .listRowBackground(Color(.clear))
            }.navigationTitle("Add Recipe")

        }
        
    }
}

#Preview {
    NewRecipeView()
}
