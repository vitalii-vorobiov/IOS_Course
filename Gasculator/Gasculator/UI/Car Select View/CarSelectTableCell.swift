//
//  CarSelectTableViewCell.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/4/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import UIKit

protocol SettingsButtonDelegate: class {
    func settingsButtonClicked(with car: Car?)
}

class CarSelectTableCell: UITableViewCell {
    weak var delegate: SettingsButtonDelegate?
    
    // MARK: Outlets
    
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carMakeAndModelLabel: UILabel!
    
    // MARK: Actions
        
    @IBAction func onSettingsButtonClicked(_ sender: Any) {
        print(car)
        delegate?.settingsButtonClicked(with: car)
    }
    
    // MARK: Content
    
    weak var car: Car?
}
