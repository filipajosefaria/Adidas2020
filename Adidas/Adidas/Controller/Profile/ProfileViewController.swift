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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    

    private func setupUI() {
        title = L10n.Profile.title.uppercased
        
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.register(cellType: ProfileCell.self)
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let profile = Profile(title: "title", value: "value")
        let model = ProfileViewModel(profile: profile)
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

