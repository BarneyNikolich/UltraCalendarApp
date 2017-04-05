//
//  RaceTableViewController.swift
//  UltraCalendarApp
//
//  Created by Barney Nikolich on 04/04/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import UIKit
import os.log

class RaceTableViewController: UITableViewController {

    //MARK: Properties
    
    //Struct holds seciton name and objects inside section!!
    struct tableSection {
        var sectionName: String!
        var sectionObjects: [Race]!
    }
    
    var objectsArray = [tableSection]()  //Array of sections - 5 elemets = 5 secitons
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load races to table view
        loadRaces()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Table view data source override methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndentifier = "RaceTableViewCell"
        
        //Create custom cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as? RaceTableViewCell else {
            fatalError("The dequeued cell is not an instance of RaceTableViewCell")
        }
        
        //Instantiate race objects from objectsArray
        let race = objectsArray[indexPath.section].sectionObjects[indexPath.row]
        
        //Give cell attributes
        cell.raceNameLabel.text = race.name
        cell.raceLogoImageView.image = race.logo
        cell.distanceLabel.text = "\(race.distance) miles"

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView()
//
//        let dateLogo = UIImageView(image: #imageLiteral(resourceName: "date"))
//        dateLogo.frame = CGRect(x: 5, y: 5, width: 35, height: 35)
//        view.addSubview(dateLogo)
//
//       // view.backgroundColor = UIColor.blue
//        return view
//    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsArray[section].sectionObjects.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return objectsArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectsArray[section].sectionName
    }

  
    //MARK: Private methods
    
    private func loadRaces() {

        //Load images
        let calderdaleHikeLogo = UIImage(named: "calderdale")
        let fellsmanLogo = UIImage(named: "fellsman")
        let bradwell = UIImage(named: "bradwell")
        let pennineLogo = UIImage(named: "pennine")
        let hardmoors60Logo = UIImage(named: "hardmoor")
        let jedburghLogo = UIImage(named: "jedburgh")
        let northantsLogo = UIImage(named: "northants")
        
        //Create race info
        let calderdaleInfo = "This classic Yorkshire Pennines trail event always attracts a lot of Runfurther runners.  It starts at Sowerby in the Calder Valley, taking a big loop around Calderdale, with a new route every three years.  There was a new route for 2015, and it takes in the hills and reservoirs to the south, visiting Windy Hill, Blackstone Edge, then heading west towards Bacup.  After Slate Pit Hill the route loops north round to Cross Stone, then crosses the main valley to Mankinholes.  This is really good running: it’s a great area with a lot of varied moorland and valley scenery.  The route is defined only by the checkpoints, and you must devise your own route between them.  Many runners lost time routefinding in 2015, but more knew where to go last year!"
        
        let fellsmanInfo = "The Fellsman is an old favourite for many of the Runfurther regulars, and it’s a special and unique race through the Yorkshire Dales.  The event centre is Threshfield and most people take the coaches provided to the start in Ingleton on Saturday morning.  It has one of the toughest kit checks in the country and the weather at the end of April can reflect any of the seasons.  The route follows a clockwise horseshoe over Ingleborough, Whernside, Gragareth and Great Coum before dropping to Dent.  After a short climb to Blea Moor you drop again to Stonehouse and the Artengill viaduct before heading up to Great Knoutberry.  The hills continue with Dodd Fell, the dreaded Fleet Moss and Yockenthwaite Moor.  Many by now will be running in the dark and so will be grouped for safety and company over the final summits of Buckden Pike and Great Whernside.  It finishes through the lovely village of Grassington and over the River Wharfe to Threshfield."
        
        let bradwellInfo = "This race first took place in 2009, and has quickly become one of the classic Peak District races, taking in both gritstone and limestone hills and valleys.  There is more climbing per mile than most long events in the Peak District, so don’t underestimate it.  It really is a great round taking in the Hope Valley, Edale, Kinder Scout and Stanage Edge, so the views are good, and there is a lot of climbing, thankfully easing off in the later stages.  If you’re going to recce anything, you should make sure you know the bit from Burbage Bridge down to the Derwent valley: most years the tape markers have gone by the time the runners get there, and every year some of us gain a few places while others get well and truly lost looking for that elusive Checkpoint 14."
    
        let pennineInfo = "This race was first run in 2015, and is organised by Joe Faulkner (of NAV4), who also organises the Tour de Helvellyn and Lakes Mountain 42 races.  The Pennine 39 follows the Pennine Way National Trail from the River Tees near Middleton-in-Teesdale to Alston.  This is the highest bit of the Pennine Way, taking in Cross Fell, at 893 metres, the highest mountain in England outside the Lakes.  The scenery is spectacular, provided the clag isn’t down.  First you follow the Tees upstream and onto the moors and the Cauldron Spout waterfall.  Then it’s on across the main watershed to reach the spectacular High Cup, where a deep glacial valley has been gouged out of the edge of the hills, with views across the Eden Valley to the Lakes.  Next it’s down to the village of Dufton, where Pennine Way walkers would be stopping overnight ready for the big push tomorrow.  We won’t be stopping though: instead we’ll be turning north up the mountains, over Cross Fell, then down a track to Garrigill and down the South Tyne to Alston."
        
        let hardmoor60Info = "This race follows the coastal half of the Cleveland Way in North Yorkshire from Guisborough to Filey: the part the Hardmoors 55 doesn’t do.  It is quite well way-marked as it follows the long distance path and once you are on the coast you just have to keep the sea on your left!"
        
        let jedburghInfo = "Each year we try to have a race in Scotland, and for 2017 we’re returning to one that is a lot easier to get to than most, for those of us living in England or Wales anyway.  Jedburgh’s just over 3 hours’ drive from Leeds or Manchester for instance.  The Scottish Borders have a lot of very runnable rolling hills that get little traffic, so paths are scarcer than we’re used to in most of the English hills.  This race is mostly on the waymarked St Cuthbert’s Way, however, following the old Roman road of Dere Street and the bank of the River Tweed, and apart from the crossing of the steep Eildon Hills it’s a trail race rather than a fell race.  The scenery is very good, and most of the route gives fast running conditions.  The majority of the route is ‘proper’ trail, ie runnable paths and old tracks, not Landrover tracks or forestry roads. The offroad sections are linked up by short sections on tarmac as the route passes through several picturesque Borders villages. It’s mainly fairly flat or gently undulating, but save something for the Eildons midway!  You’re unlikely to miss them, as they seem to be visible from nearly everywhere in the Borders."
        
        let northantsInfo = "This race follows a loop through pretty Northamptonshire countryside on paths, tracks and some minor roads.  It makes for fast running in the main, although it’s a bit hillier than you’d expect (if you’re a northerner).  It passes a number of big estates and fine old farms, and the start/finish is in the grounds of Lamport Hall, which is very grand indeed."
        
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
        
        
        //Fill objectsArray with the race obejcts - creates different sections and adds rows within
        objectsArray = [tableSection(sectionName: "April 2017", sectionObjects:[calderdaleHike, fellsman]),
                        tableSection(sectionName: "June 2017", sectionObjects:[northants]),
                        tableSection(sectionName: "August 2017", sectionObjects:[longTourOfBradwell]),
                        tableSection(sectionName: "July 2017", sectionObjects:[pennine39]),
                        tableSection(sectionName: "September 2017", sectionObjects: [hardmoor]),
                        tableSection(sectionName: "October 2017", sectionObjects: [jedburgh])
        ]
    }
    

    //Func handles transition segue from table view of races to race profile view - passes accross race object
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "ShowDetail":
            guard let raceProfileViewController = segue.destination as? RaceProfileViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedRaceCell = sender as? RaceTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedRaceCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }

            //find selected Race in the objectsArray Struct defined in Properties
            let selectedRace = objectsArray[indexPath.section].sectionObjects[indexPath.row]
            
            raceProfileViewController.race = selectedRace
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }


}
