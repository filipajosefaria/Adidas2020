//
//  NewGoalViewController.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class NewGoalViewController: UIViewController {

    @IBOutlet private weak var goalsTableView: UITableView!
    private var goalsInfo: [GoalViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getAvailableGoals()
    }
    
    private func setupUI() {
        
        goalsTableView.rowHeight = UITableView.automaticDimension
        goalsTableView.register(cellType: GoalCell.self)
    }

}

extension NewGoalViewController {
    
    private func getAvailableGoals() {
        GoalServices.getGoalsList(successBlock: { [weak self](goals) in
            
            guard let controller = self else {
                return
            }
            DispatchQueue.main.async {
                controller.goalsInfo = goals
                controller.goalsTableView.reloadData()
            }
        }) { [weak self](error) in
            
            guard let controller = self else {
                return
            }
            DispatchQueue.main.async {
                Alert.showBasicAlert(with: error.localizedDescription, on: controller)
            }
        }
    }
}

extension NewGoalViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedGoal = goalsInfo[indexPath.row].goaldId
    }
}

extension NewGoalViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return goalsInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue(indexPath, cellType: GoalCell.self)
        let model = goalsInfo[indexPath.row]
        cell.set(model: model)
        return cell
    }
    
    
}
