//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Evelina Semezyte on 2022-01-31.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        // Create an instance of data service and get the data
        
        self.recipes = DataService.getLocalData()
        
    }
}
