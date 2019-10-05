//
//  CarSelectTableViewCell.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/4/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import UIKit

class CarSelectTableViewCell: UITableViewCell {
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carMakeAndModelLabel: UILabel!
    
    weak var car: Car!
    
    @IBAction func onSettingsButtonClicked(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        let car = Car(
    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
