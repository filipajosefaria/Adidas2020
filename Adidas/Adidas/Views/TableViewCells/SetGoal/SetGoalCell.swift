//
//  SetGoalCell.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class SetGoalCell: UITableViewCell {

    @IBOutlet private weak var wrapView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        
        wrapView.backgroundColor = UIColor(hex: 0x173F5F).withAlphaComponent(0.75)
        wrapView.layer.cornerRadius = 5.0
        
        titleLabel.numberOfLines = 0
        titleLabel.text = L10n.Menu.Cell.setGoal
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 16.0)
    }

}
