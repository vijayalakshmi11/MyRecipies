//
//  ProfileView.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    @State private var isShowRecipiesList = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center) {
                    // Profile Image
                    Image(viewModel.profile.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.top, 20)
                        .accessibilityIdentifier("profileImage")
                    Text(viewModel.profile.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                        .accessibilityIdentifier("profileName")
                }
                // Education
                VStack(alignment: .leading) {
                    Text(Constatnts.education)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding(.bottom, 5)
                        .accessibilityIdentifier("educationTitle")
                    Text(viewModel.profile.education)
                        .padding(.bottom, 10)
                        .accessibilityIdentifier("educationText")
                    Text(Constatnts.experience)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding(.bottom, 5)
                        .accessibilityIdentifier("experienceTitle")
                    Text(viewModel.profile.workExperience)
                        .padding(.bottom, 10)
                        .accessibilityIdentifier("experienceText")
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 20)
            .navigationTitle(Constatnts.myProfile)
            .toolbar {
                // Toolbar item for the trailing side
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isShowRecipiesList = true
                    }) {
                        Text(Constatnts.myRecipies)
                            .foregroundColor(.black)
                            .font(.title3)
                            .fontWeight(.bold)
                            .accessibilityIdentifier(Constatnts.myRecipies)

                    }
                }
            }
            .sheet(isPresented: $isShowRecipiesList) {
                RecipeListView()
            .accessibilityIdentifier("recipeListView")

            }
        }
    }
}
#Preview {
    ProfileView()
}
