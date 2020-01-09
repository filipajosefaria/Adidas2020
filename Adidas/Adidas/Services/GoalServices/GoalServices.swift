//
//  GoalServices.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import RealmSwift

class GoalServices {
    
    class func getGoalsList(successBlock:@escaping (_ result: [GoalViewModel]) -> Void, errorBlock:@escaping (_ error: Error) -> Void){
        
        if !Connectivity.isConnectedToInternet {

            do {
                let realm = try Realm()
                let result = Array(realm.objects(Goal.self))
                let items = toViewModel(goals: result)
                successBlock(items)
            } catch let error {
                errorBlock(error)
            }
            
            return
        }
        
        NetworkService.shared.getGoalsList(successBlock: { (goals) in
            
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(goals)
                }
            } catch let error as NSError {
                print("error saving data: \(error.localizedDescription)")
            }
            let items = toViewModel(goals: goals)
            successBlock(items)
        }) { (error) in
            errorBlock(error)
        }
    }

}
