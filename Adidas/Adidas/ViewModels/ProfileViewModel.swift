//
//  ProfileViewModel.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import HealthKit

class ProfileViewModel {
    
    private static var defaultText: String = "-"
    public var dateOfBirthString: String = defaultText
    public var genderString: String = defaultText
    
    public init(profile: HealthProfile) {
        
        setGenderString(gender: profile.gender)
        setDateOfBirthString(date: profile.dateOfBirth)
    }
    
    private func setGenderString(gender: HKBiologicalSex?) {
        switch gender {
        case .female:
            genderString = L10n.Profile.Gender.female
        case .male:
            genderString = L10n.Profile.Gender.male
        case .other:
            genderString = L10n.Profile.Gender.other
        default:
            return
        }
    }
    
    private func setDateOfBirthString(date: Date?) {
        guard let date = date else {
            return
        }
        dateOfBirthString = date.formatWith()
    }
}
