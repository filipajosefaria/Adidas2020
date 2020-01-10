//
//  ViewController.swift
//  Adidas
//
//  Created by BOLD on 08/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var workoutsInfo: [WorkoutViewModel] = []
    
    @IBOutlet private weak var profileButton: UIButton!
    @IBOutlet private weak var workoutTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeatlhKit()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getWorkouts()
    }
    
    private func setupHeatlhKit() {
        
        do {
            try HealthKitServices.RequestHealthKitPermission(completion: { [weak self] (granted) in
                
                guard let controller = self else {
                    return
                }
                DispatchQueue.main.async {
                    if !granted {
                        Alert.showBasicAlert(with: L10n.Healthkit.Message.permissionNotGranted, on: controller)
                        return
                    }
                }
            })
        } catch  {
            var message:String
            switch error {
            case HealthKitErrors.HealthKitNotAvailableError :
                message = L10n.Healthkit.Error.unavailable
            case HealthKitErrors.HealthKitDataTypeNotAvailableError:
                message = L10n.Healthkit.Error.dataUnavailable
            default:
                message = L10n.Healthkit.Error.general
            }
            Alert.showBasicAlert(with: message, on: self)
        }
    }

    private func setupUI() {
        title = L10n.Menu.title.uppercased
        
        profileButton.setTitle(L10n.Menu.Button.profile.uppercased, for: .normal)
        profileButton.backgroundColor = UIColor(hex: 0xE2814D)
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.layer.cornerRadius = 5
        profileButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        workoutTableView.rowHeight = UITableView.automaticDimension
        workoutTableView.sectionHeaderHeight = 50.0
        workoutTableView.register(cellType: NewWorkoutCell.self)
        workoutTableView.register(cellType: WorkoutCell.self)
        workoutTableView.register(cellType: SetGoalCell.self)
        workoutTableView.register(cellType: GoalCell.self)
    }

}

extension MenuViewController {
    
    private func getWorkouts() {
        
        WorkoutServices.getUserWorkouts(successBlock: { [weak self] (workouts) in
            guard let controller = self else {
                return
            }
            
            DispatchQueue.main.async {
                controller.workoutsInfo = workouts
                controller.workoutTableView.reloadData()
            }
            
        }) {
        }
    }
}


extension MenuViewController: NewGoalDelegate {
    
    func newGoalSetted() {
        workoutTableView.reloadData()
    }
}

extension MenuViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
            identifier == Constants.segue.newGoal,
            let destination = segue.destination as? NewGoalViewController else {
                return
        }
        destination.delegate = self
    }
}
