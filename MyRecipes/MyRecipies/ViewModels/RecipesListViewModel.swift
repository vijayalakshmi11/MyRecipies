//
//  RecipiesViewModel.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi  on 6/12/24.
//

import Foundation

class RecipesListViewModel: ObservableObject {
    private let webService: WebServiceProtocol
    init(webService: WebServiceProtocol = Webservice()) {
        self.webService = webService
    }
    @Published var recipiesList: [RecipeViewModel] = []

    func populateRecipesList() async {
        do {
            let listOfRecipies =  try await webService.get(url: Constatnts.recipiesListUrl) { data in
               return try? JSONDecoder().decode(RecipiesListResponse.self, from: data)
            }
            self.recipiesList = listOfRecipies.meals.map(RecipeViewModel.init)
            
        } catch {
            print(error)
        }
    }
}

struct RecipeViewModel: Identifiable {
    private let meal: Meal
    init(meal: Meal) {
        self.meal = meal
    }
    var id: String {
        meal.idMeal
    }
    var strMeal: String {
        meal.strMeal
    }
    var strMealthumb: URL? {
        URL(string:meal.strMealThumb)
    }
}
