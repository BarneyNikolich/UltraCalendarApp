//
//  Race.swift
//  UltraCalendarApp
//
//  Created by Barney Nikolich on 04/04/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import UIKit

class Race {
    
    //MARK: Properties
    
    let name: String
    let logo: UIImage?
    let distance: Int
    
    let climb: Int
    let cost: Int
    let location: String
//

    
    //MARK: Initialisation
    
    //Method prepares instance of class for use, sets initial values for each properties for setup
    //? makes initialiser failable - return optional value (either value or nil) - returns optional race?
    init?(name: String, logo: UIImage?, distance: Int, climb: Int, cost: Int, location: String) {
        
        //Name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        //Distance must be over 26 or it is not classed as an ultramarathon
        guard distance > 26 else {
            return nil
        }
    
        self.name = name
        self.logo = logo
        self.distance = distance
        self.climb = climb
        self.cost = cost
        self.location = location
    }
    
    
    
}
