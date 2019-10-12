//
//  CarSelectTableViewCell.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/4/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import UIKit

protocol SettingsButtonDelegate: class {
    func settingsButtonClicked(with selectedCell: CarSelectTableCell)
}

class CarSelectTableCell: UITableViewCell {
    weak var delegate: SettingsButtonDelegate?
    
    weak var car: Car?
    
    // MARK: Outlets
    
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carMakeAndModelLabel: UILabel!
    
    // MARK: Actions
        
    @IBAction func onSettingsButtonClicked(_ sender: Any) {
        delegate?.settingsButtonClicked(with: self)
    }
}
