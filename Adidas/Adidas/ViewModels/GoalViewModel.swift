//
//  GoalViewModel.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class GoalViewModel {
    
    public var goaldId: String
    public var titleString: String
    public var goalDescriptionString: String
    public var typeString: String
    
    public init(goal: Goal) {
        titleString = goal.title
        goalDescriptionString = goal.itemDescription
        typeString = goal.type
        goaldId = goal.id
    }
}

