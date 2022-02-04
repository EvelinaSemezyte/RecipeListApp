//
//  RecipeHighlights.swift
//  RecipeListApp
//
//  Created by Evelina Semezyte on 2022-02-04.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights: [String]){
        
        // Loop through the highlights and buil string
        for index in 0..<highlights.count {
            
            // If this is a last item, don't add a comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            } else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    var body: some View {
        Text(allHighlights)
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2", "test3"])
    }
}
