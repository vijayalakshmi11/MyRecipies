//
//  Constants.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import Foundation

struct Constatnts {
    static let recipiesListUrl = URL(string:"https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
    static func recipieById(_ id: String) -> URL{
        return URL(string:"https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
    }
    static let instructionsTitle = "Instructions"
    static let ingredientsTitle = "Ingredients"
    static let education = "Education"
    static let experience = "Work Experience"
    static let myRecipies = "My Recipies"
    static let myProfile = "My Profile"
}
