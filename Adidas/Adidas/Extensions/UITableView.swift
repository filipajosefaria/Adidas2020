//
//  UITableView.swift
//  Adidas
//
//  Created by BOLD on 08/01/2020.
//  Copyright © 2020 BOLD. All rights reserved.
//

import UIKit

extension UITableView {

    func dequeue<T: UITableViewCell>(_ indexPath: IndexPath, cellType: T.Type = T.self) -> T {
        return dequeueReusableCell(withIdentifier: cellType.className, for: indexPath) as! T
    }

    func register<T: UITableViewCell>(cellType: T.Type) {
        let nib = UINib(nibName: cellType.className, bundle: Bundle(for: T.self))
        register(nib, forCellReuseIdentifier: cellType.className)
    }

}
