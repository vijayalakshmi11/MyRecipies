//
//  RecipeDetailsView.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipeId: String
    @StateObject private var recipeDetailsVM = RecipeDetailViewModel()
    var body: some View {
            ScrollView {
                ForEach(recipeDetailsVM.recipeDetails) { recipieDetails in
                    RecipeDetailsComponent(mealDetailsVM: recipieDetails)
                    }
                }
        .task {
            await recipeDetailsVM.populateRecipeDetails(recipeId: recipeId)
        }
        .ignoresSafeArea()
        .accessibilityIdentifier("recipeDetailsView")
    }
}

#Preview {
    RecipeDetailsView(recipeId: "52898")
}
