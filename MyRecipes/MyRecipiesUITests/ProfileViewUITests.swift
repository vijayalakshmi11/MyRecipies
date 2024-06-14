//
//  ProfileViewUITests.swift
//  MyRecipiesUITests
//
//  Created by Vijaya Lakshmi on 6/13/24.
//

import XCTest

final class ProfileViewUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testProfileView() throws {
        let viewModel = ProfileViewModel()
            // Verify the profile image is displayed
            let profileImage = app.images["profileImage"]
            XCTAssertTrue(profileImage.exists)
            
            // Verify the profile name is displayed
            let profileName = app.staticTexts["profileName"]
            XCTAssertTrue(profileName.exists)
        XCTAssertEqual(profileName.label, viewModel.profile.name) // Replace with the actual name

            // Verify the education text is displayed
            let educationTitle = app.staticTexts["educationTitle"]
            XCTAssertTrue(educationTitle.exists)
            XCTAssertEqual(educationTitle.label, "Education")

            let educationText = app.staticTexts["educationText"]
            XCTAssertTrue(educationText.exists)
            XCTAssertEqual(educationText.label, viewModel.profile.education) // Replace with the actual education

            // Verify the work experience text is displayed
            let experienceTitle = app.staticTexts["experienceTitle"]
            XCTAssertTrue(experienceTitle.exists)
            XCTAssertEqual(experienceTitle.label, "Work Experience")

            let experienceText = app.staticTexts["experienceText"]
            XCTAssertTrue(experienceText.exists)
            XCTAssertEqual(experienceText.label, viewModel.profile.workExperience) 
            // Replace with the actual work experience
            
            // Verify the My Recipes button exists and is clickable
            let myRecipesButton = app.buttons["My Recipies"]
            XCTAssertTrue(myRecipesButton.exists)
            
            myRecipesButton.tap()
            
            // Verify the RecipeListView is presented
            let recipeListView = app.otherElements["recipeListView"]
            XCTAssertTrue(recipeListView.waitForExistence(timeout: 5))
        }

}
