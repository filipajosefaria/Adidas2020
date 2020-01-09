//
//  HeaderView.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel!

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.font = .systemFont(ofSize: 16.0)
        titleLabel.textColor = UIColor(hex: 0x173F5F)
    }
    
    public func set(title text: String) {
        titleLabel.text = text.uppercased
    }

}
