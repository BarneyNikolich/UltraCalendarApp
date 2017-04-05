//
//  InitialiseAppData.swift
//  UltraCalendarApp
//
//  Created by Barney Nikolich on 06/04/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import UIKit

//Write function to return an array of races, with names and all required information to factor out of 'RaceTableViewController'!!!!



class AppDataHelper {
    
    static func getRaceArray() -> [Race] {
        let northantsLogo = UIImage(named: "northants")
        let jedburghLogo = UIImage(named: "jedburgh")

        
        let northantsInfo = "This race follows a loop through pretty Northamptonshire countryside on paths, tracks and some minor roads.  It makes for fast running in the main, although it’s a bit hillier than you’d expect (if you’re a northerner).  It passes a number of big estates and fine old farms, and the start/finish is in the grounds of Lamport Hall, which is very grand indeed."
        
        let jedburghInfo = "Each year we try to have a race in Scotland, and for 2017 we’re returning to one that is a lot easier to get to than most, for those of us living in England or Wales anyway.  Jedburgh’s just over 3 hours’ drive from Leeds or Manchester for instance.  The Scottish Borders have a lot of very runnable rolling hills that get little traffic, so paths are scarcer than we’re used to in most of the English hills.  This race is mostly on the waymarked St Cuthbert’s Way, however, following the old Roman road of Dere Street and the bank of the River Tweed, and apart from the crossing of the steep Eildon Hills it’s a trail race rather than a fell race.  The scenery is very good, and most of the route gives fast running conditions.  The majority of the route is ‘proper’ trail, ie runnable paths and old tracks, not Landrover tracks or forestry roads. The offroad sections are linked up by short sections on tarmac as the route passes through several picturesque Borders villages. It’s mainly fairly flat or gently undulating, but save something for the Eildons midway!  You’re unlikely to miss them, as they seem to be visible from nearly everywhere in the Borders."
        
        guard let northants = Race(name: "Northants Ultra", logo: northantsLogo, distance: 35, climb: 2080, cost: 50, location:  "Northampshire", date: "Sun 04 June", info: northantsInfo) else {
            fatalError("Could not load Northants")
        }
        
        guard let jedburgh = Race(name: "Jedburgh 3 Peaks", logo: jedburghLogo, distance: 38, climb: 3300, cost: 50, location:  "Scottish Borders", date: "Sat 28 Oct", info: jedburghInfo) else {
            fatalError("Could not load Jedburgh")
        }
        
        return [northants, jedburgh]
    }

}
