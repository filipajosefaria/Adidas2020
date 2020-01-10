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
        
        guard let type = workout.type, let start = workout.start, let end = workout.end else {
            errorBlock()
            return
        }

        let healthStore = HKHealthStore()
        let workoutConfiguration = HKWorkoutConfiguration()
        workoutConfiguration.activityType = type

        let builder = HKWorkoutBuilder(healthStore: healthStore,
                                       configuration: workoutConfiguration,
                                       device: .local())
        
        builder.beginCollection(withStart: start) { (success, error) in

            guard success else {
                errorBlock()
                return
            }
            
            builder.endCollection(withEnd: end) { (success, error) in
                guard success else {
                    errorBlock()
                    return
                }
                
                builder.finishWorkout { (workout, error) in
                    guard error == nil else {
                        errorBlock()
                        return
                    }
                    successBlock()
                }
                
            }
        }

    }
    
    class func getUserWorkouts(completion: @escaping ([HKWorkout]?, Error?) -> Void) {
        
        let sourcePredicate = HKQuery.predicateForObjects(from: .default())
        let predicates = NSCompoundPredicate(andPredicateWithSubpredicates:
        [sourcePredicate])

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: true)

        let query = HKSampleQuery(sampleType: .workoutType() , predicate: predicates, limit: 0, sortDescriptors: [sortDescriptor]) { (query, samples, error) in

              guard let samples = samples as? [HKWorkout], error == nil else {
                  completion(nil, error)
                  return
              }
              completion(samples, nil)
        }

        HKHealthStore().execute(query)
    }

}
