//
//  RecipeListcell.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import SwiftUI

struct RecipeListcell: View {
    let recipeViewModel: RecipeViewModel
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: recipeViewModel.strMealthumb) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: 160, maxHeight: 270)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color.black.opacity(0.3), radius: 15,x: 0,y: 10)
                    .overlay(alignment:.bottom) {
                        Text(recipeViewModel.strMeal)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color:.black,radius: 3,x: 0,y: 0)
                            .padding()
                            .accessibilityIdentifier("mealName")
                    }
                    .accessibilityIdentifier("loadedImage")
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 270)
                    .foregroundColor(.gray)
                    .overlay(alignment:.bottom) {
                        Text(recipeViewModel.strMeal)
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color:.black,radius: 3,x: 0,y: 0)
                            .frame(maxWidth:136)
                            .padding()
                            .accessibilityIdentifier("mealName")
                    }
                    .accessibilityIdentifier("placeholderImage")

            }
        }
    }
}
