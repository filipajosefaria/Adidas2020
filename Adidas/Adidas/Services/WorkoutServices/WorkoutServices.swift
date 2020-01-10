//
//  WorkoutServices.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import HealthKit

class WorkoutServices {

    class func save(workout: Workout, successBlock: @escaping () -> Void, errorBlock:@escaping () -> Void) {
        
        guard let type = workout.type, let start = workout.start, let end = workout.end, let quantityType = Workout.quantityType else {
            errorBlock()
            return
        }

        let healthStore = HKHealthStore()
        let workoutConfiguration = HKWorkoutConfiguration()
        workoutConfiguration.activityType = type

        let sample = HKCumulativeQuantitySample(type: quantityType, quantity: Workout.quantity, start: start, end: end)

        
        let builder = HKWorkoutBuilder(healthStore: healthStore,
                                       configuration: workoutConfiguration,
                                       device: .local())
        
        builder.add([sample]) { (success, error) in
            guard success else {
                errorBlock()
                return
            }
            
            successBlock()
        }

    }

}
