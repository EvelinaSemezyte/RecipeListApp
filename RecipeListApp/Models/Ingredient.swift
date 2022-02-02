//
//  Ingredient.swift
//  RecipeListApp
//
//  Created by Evelina Semezyte on 2022-02-02.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
}
