//
//  ProfileViewModel.swift
//  MyRecipies
//
//  Created by Vijaya Lakshmi on 6/12/24.
//

import Foundation


class ProfileViewModel: ObservableObject {
    @Published var profile: Profile
    
    init() {
        self.profile = Profile(
            name: "Vijaya",
            imageName: "profile_picture",
            education: """
            - MCA from Jawaharlal Nehru Technological University **************
            - Bsc in Computer Science, Maris Stella College *******************
            """,
            workExperience: """
            - Technical Lead at T-Mobile, December 2023 - Present
              Developed TMobile Ecommerce application on iOS Platform.

            - Associate Technical Lead at Accolite Digital,Jan 2022 - oct 2023
              Worked on Financial based applications(MobiquityPay).

            - Staff Engineer at Altimetrik, May 2021 - Jan 2022
              Worked on Financial based applications(Paypal).
            
            - Senior Consultant at Allstate Solutions, Feb 2016 - May 2021
              Created iOS SDk & static libraries on connected car platform (Driving Engine SDK)
            
            - Software Engineer at Infinite computer Solutions, Nov 2014 - Feb 2016
              Developed IBM Ecommerce application for internal customers
            
            - Associate Software Engineer at Brainistic Technologies, Jun 2013 - Nov 2014
              Created Real estae prototyping app for diffrent customers
            
            """
        )
    }
}
