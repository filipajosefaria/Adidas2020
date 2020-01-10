//
//  ProfileViewController.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var profileTableView: UITableView!
    private var profileInfo: [ProfileCellViewModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestUserProfile()
        setupUI()
    }
    

    private func setupUI() {
        title = L10n.Profile.title.uppercased
        
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.register(cellType: ProfileCell.self)
    }
    
    private func requestUserProfile() {
        do {
            profileInfo = try HealthKitServices.getUserProfile()
            profileTableView.reloadData()
        } catch {
            Alert.showBasicAlert(with: L10n.Profile.Error.gettingProfile, on: self)
        }
        
    }

}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = profileInfo[indexPath.row]
        let cell = tableView.dequeue(indexPath, cellType: ProfileCell.self)
        cell.set(model: model)
        return cell
    }
    
}

extension ProfileViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

