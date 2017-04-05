//
//  ViewController.swift
//  UltraCalendarApp
//
//  Created by Barney Nikolich on 03/04/2017.
//  Copyright © 2017 Barney Nikolich. All rights reserved.
//

import UIKit

class RaceProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var raceNameLabel: UILabel!
    @IBOutlet weak var raceLogoImage: UIImageView!
    
    var race: Race? //Race variable is passed by 'RaceTableViewController' in 'prepareForSegue(sender)' func
    
    let raceCategories = ["Distance:", "Climb:", "Cost:", "Terrain", "Location:"]
    
    let textCellIdentifier = "TextCell"

    //MARK: Table Delegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return raceCategories.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Create custom cell
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = raceCategories[row]
                
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let row = indexPath.row
        print(raceCategories[row])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
       
        // Set up views if editing an existing Meal.
        updateProfile()
    }
    
    
    //MARK: Private functions
    
    func updateProfile(){
        
        if let race = race {
            raceNameLabel.text = race.name
            navigationItem.title = race.name
            raceLogoImage.image = race.logo

        } else {
            fatalError("Could not load race profile for \(race?.name)")
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

