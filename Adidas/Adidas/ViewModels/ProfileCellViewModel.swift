//
//  ProfileCellViewModel.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class ProfileCellViewModel {
    public var titleString: String
    public var valueString: String
    
    public init(title: String, value: String) {
        titleString = title
        valueString = value
    }
}
