//
//  WorkoutViewModel.swift
//  Adidas
//
//  Created by BOLD on 10/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import HealthKit

class WorkoutViewModel {

    private static var defaultText: String = "-"
    public var typeString: String = WorkoutViewModel.defaultText
    public var durationString: String = WorkoutViewModel.defaultText
    public var dateString: String = WorkoutViewModel.defaultText
    
    public init(workout: HKWorkout) {
        dateString = workout.startDate.formatWith(format: "dd-MM-YYYY HH:mm")
        durationString = workout.duration.format() ?? ""
        setTypeString(type: workout.workoutActivityType)
    }
    
    private func setTypeString(type: HKWorkoutActivityType) {
        switch type {
        case .walking:
            typeString = L10n.Workout.Control.walk
        case .running:
            typeString = L10n.Workout.Control.run
        default:
            return
        }
    }

}
