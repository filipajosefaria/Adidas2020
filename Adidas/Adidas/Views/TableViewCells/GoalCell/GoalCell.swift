//
//  GoalCell.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    @IBOutlet private weak var wrapView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        
        wrapView.backgroundColor = UIColor(hex: 0x173F5F)
        wrapView.layer.cornerRadius = 5.0
        
        titleLabel.font = .boldSystemFont(ofSize: 25.0)
        titleLabel.textColor = UIColor.white.withAlphaComponent(0.75)
        
        descriptionLabel.font = .systemFont(ofSize: 14.0)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = UIColor.white.withAlphaComponent(0.75)
    }
    
    public func set(model: GoalViewModel) {
        
        titleLabel.text = model.titleString
        descriptionLabel.text = model.goalDescriptionString
    }
    
}
