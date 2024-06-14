//
//  RecipeDetailsViewModel.swift
//  MyRecipiesTests
//
//  Created by Vijaya Lakshmi on 6/13/24.
//

import XCTest
@testable import MyRecipies

final class RecipeDetailsViewModelTests: XCTestCase {
    let mockWebService = MockWebService()
    func testPopulateRecipeDetailsSuccess() async {
        let expectedMealDetails = setupMealDeatils()
        let response = RecipeDetailsResponse(meals: [expectedMealDetails])
        mockWebService.response = try? JSONEncoder().encode(response)
        let viewModel = RecipeDetailViewModel(webService: mockWebService)
        await viewModel.populateRecipeDetails(recipeId: "52767")
        XCTAssertEqual(viewModel.recipeDetails.count, 1)
        XCTAssertEqual(viewModel.recipeDetails.first?.id, expectedMealDetails.idMeal)
        XCTAssertEqual(viewModel.recipeDetails.first?.strMeal, expectedMealDetails.strMeal)
    }
    func testPopulateRecipeDetailsFailure() async {
        mockWebService.error = URLError(.notConnectedToInternet)
        let viewModel = RecipeDetailViewModel(webService: mockWebService)
        await viewModel.populateRecipeDetails(recipeId: "")
        XCTAssertTrue(viewModel.recipeDetails.isEmpty)
    }
    func setupMealDeatils() -> MealDetails {
        return MealDetails(idMeal: "52767", strMeal: "Bakewell tart", strDrinkAlternate: "", strCategory: "Dessert", strArea: "British", strInstructions: "sample instruction", strMealThumb: "https://www.themealdb.com/images/media/meals/wyrqqq1468233628.jpg", strTags: "", strYoutube: "", strIngredient1: "", strIngredient2: "", strIngredient3: "", strIngredient4: "", strIngredient5: "", strIngredient6: "", strIngredient7: "", strIngredient8: "", strIngredient9: "", strIngredient10: "", strIngredient11: "", strIngredient12: "", strIngredient13: "", strIngredient14: "", strIngredient15: "", strIngredient16: "", strIngredient17: "", strIngredient18: "", strIngredient19: "", strIngredient20: "", strMeasure1: "", strMeasure2: "", strMeasure3: "", strMeasure4: "", strMeasure5: "", strMeasure6: "", strMeasure7: "", strMeasure8: "", strMeasure9: "", strMeasure10: "", strMeasure11: "", strMeasure12: "", strMeasure13: "", strMeasure14: "", strMeasure15: "", strMeasure16: "", strMeasure17: "", strMeasure18: "", strMeasure19: "", strMeasure20: "", strSource: "", strImageSource: "", strCreativeCommonsConfirmed: "", dateModified: "")
    }
}
