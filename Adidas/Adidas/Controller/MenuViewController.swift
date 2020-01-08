//
//  ViewController.swift
//  Adidas
//
//  Created by BOLD on 08/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    func setupUI() {
        title = L10n.Menu.title.uppercased
    }

}

