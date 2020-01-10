//
//  Date.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

extension Date {

    func formatWith(format: String = "dd-MM-YYYY", local: Locale? = nil) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale =  local
        return formatter.string(from: self)
    }
}


extension TimeInterval {

    func format() -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.maximumUnitCount = 2
        formatter.zeroFormattingBehavior = [.pad]

        return formatter.string(from: self)
    }
}
