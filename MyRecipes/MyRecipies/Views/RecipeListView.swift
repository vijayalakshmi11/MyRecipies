//
//  ContentView.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import SwiftUI

struct RecipeListView: View {
    @StateObject var model: RecipesListViewModel = RecipesListViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160),spacing: 15)], spacing: 15) {
                    ForEach(model.recipiesList) { recipie in
                        NavigationLink(destination: RecipeDetailsView(recipeId: recipie.id)){
                            RecipeListcell(recipeViewModel: recipie)
                                .accessibilityIdentifier("recipeCell")
                        }
                    }
                }.task {
                    await model.populateRecipesList()
                }
            }
            .navigationTitle(Constatnts.myRecipies)
            .accessibilityIdentifier("recipeListScrollView")
            .toolbar {
                           ToolbarItem(placement: .navigationBarLeading) {
                               Button("Cancel") {
                                   presentationMode.wrappedValue.dismiss()
                               }
                           }
                       }
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ScrollView {
        RecipeListView()
    }
}
