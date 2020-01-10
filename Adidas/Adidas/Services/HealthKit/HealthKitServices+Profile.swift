//
//  HealthKitServices+Profile.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import HealthKit

extension HealthKitServices {
    
     class func getUserProfile() throws -> [ProfileCellViewModel] {
        
        let healthKitStore = HKHealthStore()
        
        let birthday: Date?
        let gender: HKBiologicalSex
        
        do {
            let birthdayComponents =  try healthKitStore.dateOfBirthComponents()
            birthday = birthdayComponents.date
            
            let biologicalSex =       try healthKitStore.biologicalSex()
            gender = biologicalSex.biologicalSex
           
        } catch let error {
            throw error
        }
        
        let healthProfile = HealthProfile(dateOfBirth: birthday, gender: gender)
        let info = toViewModel(profile: healthProfile)
        return info
        
    }
  
}
