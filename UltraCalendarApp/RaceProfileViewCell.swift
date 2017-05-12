//
//  RaceProfileViewCell.swift
//  UltraCalendarApp
//
//  Created by Barney Nikolich on 05/04/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import UIKit

class RaceProfileViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var racePropertyLabel: UILabel!
    @IBOutlet weak var raceInfoLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
