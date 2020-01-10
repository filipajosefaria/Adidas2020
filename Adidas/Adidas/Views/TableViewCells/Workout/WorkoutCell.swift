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
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    private func setupUI() {
        
        wrapView.backgroundColor = UIColor(hex: 0xDA5E5A)
        wrapView.layer.cornerRadius = 5.0
        
        durationLabel.textColor = .white
        durationLabel.font = .boldSystemFont(ofSize: 70.0)
        typeLabel.textColor = .white
        typeLabel.font = .systemFont(ofSize: 14.0)
        dateLabel.textColor = .white
        dateLabel.font = .systemFont(ofSize: 14.0)
    }
    
    public func set(model: WorkoutViewModel) {
        
        durationLabel.text = model.durationString
        typeLabel.text = model.typeString
        dateLabel.text = model.dateString
    }
}
