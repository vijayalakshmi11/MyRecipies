//
//  RecipieDetailViewModel.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import Foundation

class RecipeDetailViewModel: ObservableObject {
    private let webService: WebServiceProtocol
    init(webService: WebServiceProtocol = Webservice()) {
        self.webService = webService
    }
    @Published var recipeDetails: [MealDetailsViewModel] = []
    func populateRecipeDetails(recipeId: String) async {
        do {
            let recipeDetailResponse = try await webService.get(url: Constatnts.recipieById(recipeId)) {
                data in
                return try? JSONDecoder().decode(RecipeDetailsResponse.self, from: data)
            }
            recipeDetails = recipeDetailResponse.meals.map(MealDetailsViewModel.init)
            print(recipeDetails)
        } catch {
            print(error)
        }
    }
}
struct MealDetailsViewModel: Identifiable {
    private let mealDetails: MealDetails
    init(mealDetails: MealDetails) {
        self.mealDetails = mealDetails
    }
    var id: String {
        mealDetails.idMeal
    }
    var strMeal: String {
        mealDetails.strMeal
    }
    var strMealThumb: URL? {
        URL(string:mealDetails.strMealThumb)
    }
    var strInstructions: String {
        mealDetails.strInstructions
    }
    var strCategory: String {
        mealDetails.strCategory
    }
    var strArea: String {
        mealDetails.strArea
    }
    var strIngredient1: String? {
        mealDetails.strIngredient1
    }
    var strIngredient2: String? {
        mealDetails.strIngredient2
    } 
    var strIngredient3: String? {
        mealDetails.strIngredient3
    } 
    var strIngredient4: String? {
        mealDetails.strIngredient4
    } 
    var strIngredient5: String? {
        mealDetails.strIngredient5
    }
    var strIngredient6: String? {
        mealDetails.strIngredient6
    } 
    var strIngredient7: String? {
        mealDetails.strIngredient7
    } 
    var strIngredient8: String? {
        mealDetails.strIngredient8
    }
    var strIngredient9: String? {
        mealDetails.strIngredient9
    }
    var strIngredient10: String? {
        mealDetails.strIngredient10
    }
    var strIngredient11: String? {
        mealDetails.strIngredient11
    }
    var strIngredient12: String? {
        mealDetails.strIngredient12
    }
    var strIngredient13: String? {
        mealDetails.strIngredient13
    }
    var strIngredient14: String? {
        mealDetails.strIngredient14
    }
    var strIngredient15: String? {
        mealDetails.strIngredient15
    }
    var strIngredient16: String? {
        mealDetails.strIngredient16
    }
    var strIngredient17: String? {
        mealDetails.strIngredient17
    }
    var strIngredient18: String? {
        mealDetails.strIngredient18
    }
    var strIngredient19: String? {
        mealDetails.strIngredient19
    }
    var strIngredient20: String? {
        mealDetails.strIngredient20
    }
    var strMeasure1: String? {
        mealDetails.strMeasure1
    }
    var strMeasure2: String? {
        mealDetails.strMeasure2
    }
    var strMeasure3: String? {
        mealDetails.strMeasure3
    }
    var strMeasure4: String? {
        mealDetails.strMeasure4
    }
    var strMeasure5: String? {
        mealDetails.strMeasure5
    }
    var strMeasure6: String? {
        mealDetails.strMeasure6
    }
    var strMeasure7: String? {
        mealDetails.strMeasure7
    }
    var strMeasure8: String? {
        mealDetails.strMeasure8
    }
    var strMeasure9: String? {
        mealDetails.strMeasure9
    }
    var strMeasure10: String? {
        mealDetails.strMeasure10
    }
    var strMeasure11: String? {
        mealDetails.strMeasure11
    }
    var strMeasure12: String? {
        mealDetails.strMeasure12
    }
    var strMeasure13: String? {
        mealDetails.strMeasure13
    }
    var strMeasure14: String? {
        mealDetails.strMeasure14
    }
    var strMeasure15: String? {
        mealDetails.strMeasure15
    }
    var strMeasure16: String? {
        mealDetails.strMeasure16
    }
    var strMeasure17: String? {
        mealDetails.strMeasure17
    }
    var strMeasure18: String? {
        mealDetails.strMeasure18
    }
    var strMeasure19: String? {
        mealDetails.strMeasure19
    }
    var strMeasure20: String? {
        mealDetails.strMeasure20
    }
    var ingredients: [(ingredient: String, measure: String)] {
        let ingredientArray = [
            strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
            strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10,
            strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15,
            strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        ]
        
        let measureArray = [
            strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5,
            strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10,
            strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15,
            strMeasure16, strMeasure17, strMeasure18, strMeasure19, strMeasure20
        ]
        
        var ingredientsAndMeasures: [(ingredient: String, measure: String)] = []
        
        for (ingredient, measure) in zip(ingredientArray, measureArray) {
            if let ingredient = ingredient, !ingredient.isEmpty,
               let measure = measure, !measure.isEmpty {
                ingredientsAndMeasures.append((ingredient, measure))
            }
        }
        
        return ingredientsAndMeasures
    }
}
