//
//  Workout.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//
import Foundation
import HealthKit

class Workout {
    var start: Date?
    var end: Date?
    var type: HKWorkoutActivityType?
    
    var finished: Bool {
        return end != nil
    }
    
    public init(type: HKWorkoutActivityType? = nil) {
        self.type = type
        self.start = Date()
    }
    
    public func finish() {
        self.end = Date()
    }
    
}
