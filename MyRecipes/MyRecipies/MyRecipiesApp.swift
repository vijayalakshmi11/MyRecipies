//
//  MyRecipiesApp.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import SwiftUI

@main
struct MyRecipiesApp: App {
    @StateObject var recipiesViewModel = RecipesListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ProfileView()
        }
    }
}
