//
//  MenuViewController+UITableView.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeue(indexPath, cellType: NewWorkoutCell.self)
            return cell
        case 1:
            
            if let savedGoal = UserDefaults.standard.object(forKey: Constants.UserDefaults.userGoal ) as? Data,
                let model = try? JSONDecoder().decode(GoalViewModel.self, from: savedGoal) {
                
                let cell = tableView.dequeue(indexPath, cellType: GoalCell.self)
                cell.set(model: model)
                return cell
            }
            
            let cell = tableView.dequeue(indexPath, cellType: SetGoalCell.self)
            return cell
        default:
            let cell = tableView.dequeue(indexPath, cellType: WorkoutCell.self)
            return cell
        }
    }
    
}

extension MenuViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: Constants.segue.newWorkout)
        case 1:
            performSegue(withIdentifier: Constants.segue.newGoal)
        default:
            print("Display workout")
        }
    }
}
