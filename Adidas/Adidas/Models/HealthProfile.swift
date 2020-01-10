//
//  Profile.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import HealthKit

struct HealthProfile {
    var dateOfBirth: Date?
    var gender: HKBiologicalSex?
    var height: String?
    var bodyMass: String?
    var bodyFat: String?
    
    init(dateOfBirth: Date?, gender: HKBiologicalSex?) {
        self.dateOfBirth = dateOfBirth
        self.gender = gender
    }
}
