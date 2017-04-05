//
//  RaceTableViewController.swift
//  UltraCalendarApp
//
//  Created by Barney Nikolich on 04/04/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import UIKit

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
        cell.distanceLabel.text = "\(race.distance)"

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
        let lakelandsLogo = UIImage(named: "lakelands")
        
        //Create race objects
        guard let calderdaleHike = Race(name: "Calderdale Hike", logo: calderdaleHikeLogo, distance: 37) else {
            fatalError("Could not load calderdale hike")
        }
        
        guard let fellsman = Race(name: "Fellsman", logo: fellsmanLogo, distance: 62) else {
            fatalError("Could not load Fellsman")
        }
        
        guard let lakeRace = Race(name: "Lakelands 100", logo: lakelandsLogo, distance: 100) else {
            fatalError("Could not load Lakelands 100")
        }

        //Fill objectsArray with the race obejcts.
        objectsArray = [tableSection(sectionName: "February 2017", sectionObjects:[calderdaleHike]),
                        tableSection(sectionName: "March 2017", sectionObjects:[fellsman]),
                        tableSection(sectionName: "April 2017", sectionObjects:[fellsman, calderdaleHike]),
                        tableSection(sectionName: "May 2017", sectionObjects:[lakeRace])
        ]
        
        
    }

}
