//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Evelina Semezyte on 2022-01-31.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @State var selectedServingSize = 2
    var recipe: Recipe
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)
                
                // MARK: Serving Size Picker
                VStack {
                Text("Select your serving size: ")
                Picker("", selection: $selectedServingSize) {
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                }
                .pickerStyle(.segmented)
                .frame(width: 160)
                }.padding()
                
                // MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(recipe.ingredients) { ing in
                        Text("• " + RecipeModel.getPorcion(ingredient: ing, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + ing.name.lowercased())
                            .padding(.vertical, 2)
                    }
                }.padding()
                
                
                // MARK: Divider
                Divider()
                
                
                // MARK: Direction
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " +  recipe.directions[index])
                            .padding(.vertical, 5)
                    }
                    
                }
                .padding()
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe
        var model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[1])
    }
}
