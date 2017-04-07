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
        tabBarItem = UITabBarItem(title: "Authors", image: UIImage(named: "homeIcon"), tag: 0)

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
        //Fill objectsArray with the race obejcts - creates different sections and adds rows within
        objectsArray = [tableSection(sectionName: "April 2017", sectionObjects:[AppDataHelper.getRaceByName(raceName: "Calderdale Hike"), AppDataHelper.getRaceByName(raceName: "Fellsman")]),
                        tableSection(sectionName: "June 2017", sectionObjects:[AppDataHelper.getRaceByName(raceName: "Northants Ultra")]),
                        tableSection(sectionName: "August 2017", sectionObjects:[AppDataHelper.getRaceByName(raceName: "Long Tour Bradwell")]),
                        tableSection(sectionName: "July 2017", sectionObjects:[AppDataHelper.getRaceByName(raceName: "Pennine 39")]),
                        tableSection(sectionName: "September 2017", sectionObjects: [AppDataHelper.getRaceByName(raceName: "Hardmoor 60")]),
                        tableSection(sectionName: "October 2017", sectionObjects: [AppDataHelper.getRaceByName(raceName: "Jedburgh 3 Peaks")])
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
