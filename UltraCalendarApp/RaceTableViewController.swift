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
    
    var races = [Race]() //Empty array of races - each element is a row
    
    //MARK: Private methods
    
    private func loadRaces() {
        
        //Load imges
        let calderdaleHikeLogo = UIImage(named: "calderdale")
        let fellsmanLogo = UIImage(named: "fellsman")
        let lakelandsLogo = UIImage(named: "lakelands")
        
        guard let calderdaleHike = Race(name: "Calderdale Hike", logo: calderdaleHikeLogo, distance: 37) else {
            fatalError("Could not load calderdale hike")
        }
        
        guard let fellsman = Race(name: "Fellsman", logo: fellsmanLogo, distance: 62) else {
            fatalError("Could not load Fellsman")
        }
        
        guard let lakeRace = Race(name: "Lakelands 100", logo: lakelandsLogo, distance: 100) else {
            fatalError("Could not load Lakelands 100")
        }
        
        races += [calderdaleHike, fellsman, lakeRace]
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load races to table view
        loadRaces()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count //Indicates how many rows in table view
    }

    //Method creates each uniform cell with different information from the races array. Length of array = number of rows
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIndentifier = "RaceTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as? RaceTableViewCell else {
                fatalError("The dequeued cell is not an instance of RaceTableViewCell")
            }
        
        //Fetch race from races array
        let race = races[indexPath.row]
        
        cell.raceNameLabel.text = race.name
        cell.raceLogoImageView.image = race.logo
        cell.distanceLabel.text = "\(race.distance)"
        
        // Configure the cell...

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
