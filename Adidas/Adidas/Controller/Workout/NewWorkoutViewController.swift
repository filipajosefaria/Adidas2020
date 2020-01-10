//
//  NewWorkoutViewController.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    @IBOutlet private weak var workoutTypeControl: UISegmentedControl!
    @IBOutlet private weak var timerLabel: UILabel!
    @IBOutlet private weak var stopButton: UIButton!
    
    private var workout: Workout = Workout(type: .running)
    private weak var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupTimer()
    }
    
    private func setupUI() {
        workoutTypeControl.setTitle(L10n.Workout.Control.run, forSegmentAt: 0)
        workoutTypeControl.setTitle(L10n.Workout.Control.walk, forSegmentAt: 1)
        
        timerLabel.text = "00:00"
        timerLabel.font = .boldSystemFont(ofSize: 70.0)
        timerLabel.textColor = .white
        timerLabel.backgroundColor = UIColor(hex: 0xDA5E5A)
        timerLabel.layer.cornerRadius = 5.0
        timerLabel.clipsToBounds = true
        
        stopButton.setTitle(L10n.Workout.Button.stop.uppercased, for: .normal)
        stopButton.backgroundColor = UIColor(hex: 0xE2814D)
        stopButton.setTitleColor(.white, for: .normal)
        stopButton.layer.cornerRadius = 5
        stopButton.titleLabel?.font = .boldSystemFont(ofSize: 30)
    }
    
    private func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let controller = self else { return }
            controller.updateTimerLabel()
        }
    }
    
    private func stopTime() {
        timer.invalidate()
    }
    
    private func updateTimerLabel() {
        guard let start = workout.start else {
            return
        }
        let duration = Date().timeIntervalSince(start)
        timerLabel.text = duration.format()
    }
   
    
}

extension NewWorkoutViewController{
    
    @IBAction private func indexChanged(_ sender: Any) {
        
       switch workoutTypeControl.selectedSegmentIndex {
       case 0:
           workout.type = .running
       case 1:
           workout.type = .walking
       default:
           workout.type = .none
       }
    }
    
    @IBAction private func stopButtonAction(_ sender: Any) {
        guard workout.finished else {
            finishWorkout()
            return
        }
        
        WorkoutServices.save(workout: workout, successBlock: { [weak self] in
            guard let controller = self else {
                return
            }
            
            DispatchQueue.main.async {
                controller.navigationController?.popViewController(animated: true)
            }
        }) { [weak self] in
            guard let controller = self else {
                return
            }
            DispatchQueue.main.async {
                Alert.showBasicAlert(with: L10n.Workout.Alert.error, on: controller)
            }
        }
        
    }
}

extension NewWorkoutViewController {
    
    private func finishWorkout() {
        timer.invalidate()
        workout.finish()
        stopButton.setTitle(L10n.Workout.Button.save.uppercased, for: .normal)
    }
}
