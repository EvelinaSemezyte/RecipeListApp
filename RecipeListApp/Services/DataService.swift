//
//  DataService.swift
//  RecipeListApp
//
//  Created by Evelina Semezyte on 2022-01-31.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse the local json file
        
        // Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString isn't nil, otherwise...
        guard pathString != nil else{
            return [Recipe]()
        }
        
        // Create the url object
        let url = URL(fileURLWithPath: pathString!)
        
        // Error handling
        do {
            // Create the data object
            let data = try Data(contentsOf: url)
            
            // Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // Add the unique IDs to Recipes
                for rec in recipeData {
                    rec.id = UUID()
                    
                    // Add the unique IDs to recipe Ingrediens
                    for i in rec.ingredients {
                        i.id = UUID()
                    }
                }
                // Return the recipes
                return recipeData
            }
            catch{
                // Error with parsing JSON
                print(error)
            }
        }
        catch{
            // Error with getting data
            print(error)
        }
        return [Recipe]()
    }
}
