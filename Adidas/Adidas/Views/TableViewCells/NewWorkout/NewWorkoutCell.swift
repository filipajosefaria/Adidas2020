//
//  NewWorkoutCell.swift
//  Adidas
//
//  Created by BOLD on 08/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class NewWorkoutCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.text = L10n.Menu.Cell.newWorkout
        titleLabel.textColor = .darkGray
        titleLabel.font = .systemFont(ofSize: 16.0)
    }
    
}
