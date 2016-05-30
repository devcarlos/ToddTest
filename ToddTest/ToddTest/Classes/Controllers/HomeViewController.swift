//
//  HomeViewController.swift
//  ToddTest
//
//  Created by Carlos Alcala on 5/30/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK : Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var runButton: UIButton!
    @IBOutlet weak var addPatientButton: UIBarButtonItem!
    
    
    //MARK : Controller Lifecycle
    
    override func viewDidLoad() {
        
    }

    //MARK : Actions
    
    
    @IBAction func addPatient(sender: AnyObject) {
        
        
        
    }

    //MARK : TableView DataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PatientCell", forIndexPath: indexPath)
        
        
        cell.textLabel?.text = "Patient: Carlos Alcala"
        cell.detailTextLabel?.text = "0% Probability of Todd Syndrome"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("SELECTED: \(indexPath.row)")
        
    }
}
