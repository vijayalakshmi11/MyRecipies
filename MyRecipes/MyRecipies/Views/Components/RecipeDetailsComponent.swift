//
//  RecipeDetailsCell.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import SwiftUI

struct RecipeDetailsComponent: View {
    let mealDetailsVM: MealDetailsViewModel
    let bounds = UIScreen.main.bounds
    var body: some View {
        VStack {
            AsyncImage(url:(mealDetailsVM.strMealThumb)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: bounds.width)
            } placeholder: {
                ProgressView()
            }
            .padding(.bottom, 20)
            Text(mealDetailsVM.strMeal)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
            VStack (alignment: .leading, spacing: 10) {
                Text(Constatnts.instructionsTitle)
                    .font(.headline)
                Text(mealDetailsVM.strInstructions)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 3)
                Text(Constatnts.ingredientsTitle)
                    .font(.headline)
                ForEach(mealDetailsVM.ingredients, id: \.ingredient) { ingredient, measure in
                    HStack {
                        Text(ingredient)
                        Spacer()
                        Text(measure)
                    }
                    .padding(.vertical, 2)
                }
            }
            .padding(.horizontal)
        }
    }
}
