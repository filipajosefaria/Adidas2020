//
//  ProfileCell.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    private func setupUI(){
        
        titleLabel.font = .boldSystemFont(ofSize: 16.0)
        valueLabel.font = .systemFont(ofSize: 16.0)
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func set(model: ProfileViewModel) {
        
        titleLabel.text = model.titleString
        valueLabel.text = model.valueString
    }
}
