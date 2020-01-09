//
//  WorkoutCell.swift
//  Adidas
//
//  Created by BOLD on 08/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class WorkoutCell: UITableViewCell {

    @IBOutlet private weak var wrapView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    private func setupUI() {
        
        wrapView.backgroundColor = UIColor(hex: 0xDA5E5A)
        wrapView.layer.cornerRadius = 5.0
    }
    
}
