//
//  SearchTableViewCell.swift
//  UltraCalendarApp
//
//  Created by Barney Nikolich on 11/05/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var location: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
