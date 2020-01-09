//
//  ProfileViewModel.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class ProfileViewModel {
    
    public let titleString: String
    public let valueString: String
    
    public init(profile: Profile) {
        titleString = "\(profile.title):"
        valueString = profile.value
    }
}
