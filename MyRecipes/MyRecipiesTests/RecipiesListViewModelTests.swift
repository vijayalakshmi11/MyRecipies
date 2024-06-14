//
//  RecipiesListViewModelTests.swift
//  MyRecipiesTests
//
//  Created by Vijaya Lakshmi on 6/13/24.
//

import XCTest
@testable import MyRecipies

final class RecipiesListViewModelTests: XCTestCase {
    let mockWebService = MockWebService()
    func testPopulateRecipesListSuccess() async {
        let expectedMeal = Meal(strMeal: "Apple Frangipan Tart", strMealThumb: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg", idMeal: "52768")
        let response = RecipiesListResponse(meals: [expectedMeal])
        mockWebService.response = try? JSONEncoder().encode(response)
        let viewModel = RecipesListViewModel(webService: mockWebService)
        await viewModel.populateRecipesList()
        XCTAssertEqual(viewModel.recipiesList.count, 1)
        XCTAssertEqual(viewModel.recipiesList.first?.id, expectedMeal.idMeal)
        XCTAssertEqual(viewModel.recipiesList.first?.strMeal, expectedMeal.strMeal)
    }
    func testPopulateRecipeDetailsFailure() async {
        mockWebService.error = URLError(.notConnectedToInternet)
        let viewModel = RecipesListViewModel(webService: mockWebService)
        await viewModel.populateRecipesList()
        XCTAssertTrue(viewModel.recipiesList.isEmpty)
    }
}
