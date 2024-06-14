//
//  DessertsList.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import Foundation

// MARK: - Welcome
struct RecipiesListResponse: Codable {
    let meals: [Meal]
}

// MARK: - Meal
struct Meal: Codable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}
