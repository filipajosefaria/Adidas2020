//
//  HealthKitServices.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import HealthKit

enum HealthKitErrors: Error {
    case HealthKitNotAvailableError
    case HealthKitDataTypeNotAvailableError
    case HealthKitUnknownError
}

class HealthKitServices {
    
    class func RequestHealthKitPermission(completion: @escaping (Bool) -> Void) throws {
        
        guard HKHealthStore.isHealthDataAvailable() else {
            throw HealthKitErrors.HealthKitNotAvailableError
        }
        
        guard let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth),
            let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex),
            let height = HKObjectType.quantityType(forIdentifier: .height),
            let distanceWalkingRunning = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning),
            let stepCount = HKObjectType.quantityType(forIdentifier: .stepCount),
            let activeEnergy = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else {
                
                throw HealthKitErrors.HealthKitDataTypeNotAvailableError
        }
        
        let healthKitTypesToWrite: Set<HKSampleType> = [
                                                        activeEnergy,
                                                        distanceWalkingRunning,
                                                        stepCount,
                                                        HKObjectType.workoutType()]
        
        let healthKitTypesToRead: Set<HKObjectType> = [dateOfBirth,
                                                       biologicalSex,
                                                       height,
                                                       distanceWalkingRunning,
                                                       stepCount,
                                                       HKObjectType.workoutType()]
        
        HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite,
                                             read: healthKitTypesToRead) { (success, error) in
                                                
                                                completion(success)
        }
    }
}
