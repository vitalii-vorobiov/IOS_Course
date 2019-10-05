//
//  TripDestinationsTableViewCell.swift
//  Gasculator
//
//  Created by Adriyan Bevz on 10/4/19.
//  Copyright © 2019 4andahalf. All rights reserved.
//

import UIKit

class TripDestinationsTableViewCell: UITableViewCell {
    @IBOutlet weak var SelectButton: UIButton!
    
//    bbbbb
    @IBOutlet weak var deleteButton: CustomButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        deleteButton.subviews.forEach { (view) in
            if view is UIImageView {
                view.contentMode = .scaleAspectFit
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
