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
    
    
    //Helper fucntion to return a specific race object based on race name
    static func getRaceByName(raceName: String) -> Race {
        let races = AppDataHelper.getRaceArray()
        
        guard let index = races.index(where: { (currentRace) -> Bool in
            currentRace.name == raceName
            
        }) else {
            fatalError("Searched for race that does not exist, check name is correct")
        }
        return races[index]
    }
    
    //Function to populate all Race data for the app into an array
    static func getRaceArray() -> [Race] {
        
        //Load images
        let calderdaleHikeLogo = UIImage(named: "calderdale")
        let fellsmanLogo = UIImage(named: "fellsman")
        let bradwell = UIImage(named: "bradwell")
        let pennineLogo = UIImage(named: "pennine")
        let hardmoors60Logo = UIImage(named: "hardmoor")
        let jedburghLogo = UIImage(named: "jedburgh")
        let northantsLogo = UIImage(named: "northants")
        let whiteroseulta = UIImage(named: "whiterose")
        let roundroth = UIImage(named: "roundroth")

        //Create race info
        let calderdaleInfo = "This classic Yorkshire Pennines trail event always attracts a lot of Runfurther runners.  It starts at Sowerby in the Calder Valley, taking a big loop around Calderdale, with a new route every three years.  There was a new route for 2015, and it takes in the hills and reservoirs to the south, visiting Windy Hill, Blackstone Edge, then heading west towards Bacup.  After Slate Pit Hill the route loops north round to Cross Stone, then crosses the main valley to Mankinholes.  This is really good running: it’s a great area with a lot of varied moorland and valley scenery.  The route is defined only by the checkpoints, and you must devise your own route between them.  Many runners lost time routefinding in 2015, but more knew where to go last year!"
        
        let fellsmanInfo = "The Fellsman is an old favourite for many of the Runfurther regulars, and it’s a special and unique race through the Yorkshire Dales.  The event centre is Threshfield and most people take the coaches provided to the start in Ingleton on Saturday morning.  It has one of the toughest kit checks in the country and the weather at the end of April can reflect any of the seasons.  The route follows a clockwise horseshoe over Ingleborough, Whernside, Gragareth and Great Coum before dropping to Dent.  After a short climb to Blea Moor you drop again to Stonehouse and the Artengill viaduct before heading up to Great Knoutberry.  The hills continue with Dodd Fell, the dreaded Fleet Moss and Yockenthwaite Moor.  Many by now will be running in the dark and so will be grouped for safety and company over the final summits of Buckden Pike and Great Whernside.  It finishes through the lovely village of Grassington and over the River Wharfe to Threshfield."
        
        let bradwellInfo = "This race first took place in 2009, and has quickly become one of the classic Peak District races, taking in both gritstone and limestone hills and valleys.  There is more climbing per mile than most long events in the Peak District, so don’t underestimate it.  It really is a great round taking in the Hope Valley, Edale, Kinder Scout and Stanage Edge, so the views are good, and there is a lot of climbing, thankfully easing off in the later stages.  If you’re going to recce anything, you should make sure you know the bit from Burbage Bridge down to the Derwent valley: most years the tape markers have gone by the time the runners get there, and every year some of us gain a few places while others get well and truly lost looking for that elusive Checkpoint 14."
        
        let pennineInfo = "This race was first run in 2015, and is organised by Joe Faulkner (of NAV4), who also organises the Tour de Helvellyn and Lakes Mountain 42 races.  The Pennine 39 follows the Pennine Way National Trail from the River Tees near Middleton-in-Teesdale to Alston.  This is the highest bit of the Pennine Way, taking in Cross Fell, at 893 metres, the highest mountain in England outside the Lakes.  The scenery is spectacular, provided the clag isn’t down.  First you follow the Tees upstream and onto the moors and the Cauldron Spout waterfall.  Then it’s on across the main watershed to reach the spectacular High Cup, where a deep glacial valley has been gouged out of the edge of the hills, with views across the Eden Valley to the Lakes.  Next it’s down to the village of Dufton, where Pennine Way walkers would be stopping overnight ready for the big push tomorrow.  We won’t be stopping though: instead we’ll be turning north up the mountains, over Cross Fell, then down a track to Garrigill and down the South Tyne to Alston."
        
        let hardmoor60Info = "This race follows the coastal half of the Cleveland Way in North Yorkshire from Guisborough to Filey: the part the Hardmoors 55 doesn’t do.  It is quite well way-marked as it follows the long distance path and once you are on the coast you just have to keep the sea on your left!"
        
        let jedburghInfo = "Each year we try to have a race in Scotland, and for 2017 we’re returning to one that is a lot easier to get to than most, for those of us living in England or Wales anyway.  Jedburgh’s just over 3 hours’ drive from Leeds or Manchester for instance.  The Scottish Borders have a lot of very runnable rolling hills that get little traffic, so paths are scarcer than we’re used to in most of the English hills.  This race is mostly on the waymarked St Cuthbert’s Way, however, following the old Roman road of Dere Street and the bank of the River Tweed, and apart from the crossing of the steep Eildon Hills it’s a trail race rather than a fell race.  The scenery is very good, and most of the route gives fast running conditions.  The majority of the route is ‘proper’ trail, ie runnable paths and old tracks, not Landrover tracks or forestry roads. The offroad sections are linked up by short sections on tarmac as the route passes through several picturesque Borders villages. It’s mainly fairly flat or gently undulating, but save something for the Eildons midway!  You’re unlikely to miss them, as they seem to be visible from nearly everywhere in the Borders."
        
        let northantsInfo = "This race follows a loop through pretty Northamptonshire countryside on paths, tracks and some minor roads.  It makes for fast running in the main, although it’s a bit hillier than you’d expect (if you’re a northerner).  It passes a number of big estates and fine old farms, and the start/finish is in the grounds of Lamport Hall, which is very grand indeed."
        
        let whiteroseInfo = "This is a 30-mile loop round Marsden and Slaithwaite, in the Pennine hills near Huddersfield.  It includes parts of the Pennine Way and the Kirklees Way, and should make for really good running, with variety and interest.  I haven’t run the race myself yet, but from my knowledge of the area I think there are similarities to the Haworth Hobble – moorland and rough pasture, and about the same amount of climbing per mile. There are 60-mile and 100-mile options as well, but your Runfurther points can only be earned from the 1-lap 30-mile race.  The 60-mile race is simply 2 loops of the same route, however, and the 100-mile race 3 loops with an additional 10 mile section at the end.  If you want to enter one of the longer races it may be possible to get an official time for your first 30 miles however, and we would then count that for Runfurther points.  We haven’t confirmed that with the race organisers yet though, so check with them first."
        
        let roundrothInfo = "The Round Rotherham 50 was first run in 1983, so it has a lot of history.  It’s a fast race as the route is fairly flat and virtually all runnable as it’s nearly all on good paths and tracks.  It starts and finishes at a college sports centre near Rotherham, and the route is a mixture of old industrial areas being reclaimed by woodland, river and canal banks, and quiet farmland.  It starts at 7am, but you can sleep overnight the night before in the sports hall if you want."
        
        //Create race objects
        guard let calderdaleHike = Race(name: "Calderdale Hike", logo: calderdaleHikeLogo, distance: 37, climb: 6600, cost: 15, location: "West Yorkshire", date: "Sat 1 April", info: calderdaleInfo) else {
            fatalError("Could not load calderdale hike")
        }
        
        guard let fellsman = Race(name: "Fellsman", logo: fellsmanLogo, distance: 61, climb: 11000, cost: 20, location:  "Yorkshire Dales", date: "Sat 29 April", info: fellsmanInfo) else {
            fatalError("Could not load Fellsman")
        }
        
        guard let longTourOfBradwell = Race(name: "Long Tour Bradwell", logo: bradwell, distance: 33, climb: 6300, cost: 20, location:  "Peak District", date: "Sat 12 August", info: bradwellInfo) else {
            fatalError("Could not load Bradwell")
        }
        
        guard let pennine39 = Race(name: "Pennine 39", logo: pennineLogo, distance: 39, climb: 5600, cost: 20, location:  "North Pennines", date: "Sat 8 July", info: pennineInfo) else {
            fatalError("Could not load pennine 39")
        }
        
        guard let hardmoor = Race(name: "Hardmoor 60", logo: hardmoors60Logo, distance: 62, climb: 8850, cost: 50, location:  "North York Moors", date: "Sat 16 September", info: hardmoor60Info) else {
            fatalError("Could not load Hardmoor")
        }
        
        guard let jedburgh = Race(name: "Jedburgh 3 Peaks", logo: jedburghLogo, distance: 38, climb: 3300, cost: 50, location:  "Scottish Borders", date: "Sat 28 Oct", info: jedburghInfo) else {
            fatalError("Could not load Jedburgh")
        }
        
        guard let northants = Race(name: "Northants Ultra", logo: northantsLogo, distance: 35, climb: 2080, cost: 50, location:  "Northampshire", date: "Sun 04 June", info: northantsInfo) else {
            fatalError("Could not load Northants")
        }
        
        guard let whiterose = Race(name: "White Rose Ultra", logo: whiteroseulta, distance: 30, climb: 3865, cost: 33, location:  "Yorkshire", date: "Sat 04 November", info: whiteroseInfo) else {
            fatalError("Could not load White Rose Ultra")
        }
        
        guard let roundRoth = Race(name: "Round Rotherham", logo: roundroth, distance: 50, climb: 3100, cost: 45, location:  "Yorkshire", date: "Sat 14 October", info: roundrothInfo) else {
            fatalError("Could not load White Rose Ultra")
        }
        
        
        return [calderdaleHike, fellsman, longTourOfBradwell, pennine39, hardmoor, jedburgh, northants, whiterose, roundRoth]
    }

}
