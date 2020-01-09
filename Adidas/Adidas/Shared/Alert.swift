//
//  Alert.swift
//  Adidas
//
//  Created by BOLD on 09/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class Alert {

     class func showBasicAlert(with message:String, on vc:UIViewController) {
        let alert: UIAlertController = UIAlertController(title: L10n.Alert.title,
                                                        message: message,
                                                        preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: L10n.Alert.ok, style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}
