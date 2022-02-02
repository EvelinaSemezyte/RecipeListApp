//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Evelina Semezyte on 2022-01-31.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                
                // MARK: Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    
                
                
                // MARK: Ingredients
                VStack(alignment: .leading){
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical, 5)
                    
                    ForEach(recipe.ingredients) { ing in
                        Text("• " + ing.name)
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
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        // Create a dummy recipe
        var model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[1])
    }
}
