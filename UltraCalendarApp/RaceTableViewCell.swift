//
//  RaceTableViewCell.swift
//  UltraCalendarApp
//
//  Created by Barney Nikolich on 04/04/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import UIKit

class RaceTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var raceNameLabel: UILabel!
    @IBOutlet weak var raceLogoImageView: UIImageView!
    @IBOutlet weak var distanceLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
