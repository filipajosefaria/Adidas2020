//
//  GoalServices.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit
import RealmSwift

class GoalServices {
    
    class func getGoalsList(successBlock:@escaping (_ result: [GoalViewModel]) -> Void, errorBlock:@escaping (_ error: Error) -> Void){
        
        NetworkService.shared.getGoalsList(successBlock: { (goals) in
            
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(goals)
                }
            } catch let error as NSError {
                print("error saving data: \(error.localizedDescription)")
            }
            
            var items: [GoalViewModel] = []
            goals.forEach { (goal) in
               let item = GoalViewModel(goal: goal)
               items.append(item)
            }
            successBlock(items)
        }) { (error) in
            errorBlock(error)
        }
    }
}
