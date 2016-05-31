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
    @IBOutlet weak var addPatientButton: UIBarButtonItem!

    var patients:[TDPatient] = []

    
    //MARK : Controller Lifecycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //load data
        self.loadData()
    }
    
    //MARK : Fetch Data
    func loadData() {

        //create default data the first time
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.boolForKey("FirstTime") == false {
            //setup static patients
            let staticPatients = [
                TDPatient(name: "Carlos Alcala", migraines: true, age: 15, gender: .Male, drugs: true),
                TDPatient(name: "John Smith", migraines: false, age: 12, gender: .Male, drugs: true),
                TDPatient(name: "Brian Hamilton", migraines: true, age: 30, gender: .Male, drugs: false),
                TDPatient(name: "Michele Gordon", migraines: false, age: 40, gender: .Female, drugs: true),
                TDPatient(name: "Jessica McDonald", migraines: false, age: 21, gender: .Female, drugs: false)
            ]
            
            //save to core data
            for patient in staticPatients {
                DataManager.savePatient(patient)
            }
            
            defaults.setBool(true, forKey: "FirstTime")
            defaults.synchronize()
        }
        
        
        //--------------------------------
        // ------ LOAD CORE  DATA  -------
        //--------------------------------
        
        self.patients = DataManager.fetchPatients()
        self.tableView.reloadData()
        
        
        //------------------------------------
        // ------ LOAD FROM API CALLBACK  ----
        //------------------------------------
        
//        //retrieve patiens from backend API
//        APIManager.fetchPatients({(patients: [TDPatient], error: NSError?) in
//            if error == nil {
//                self.patients = patients
//                self.tableView.reloadData()
//            } else {
//              //show error here
//            }
//        })
        
        
    }

    //MARK : Actions
    
    
    @IBAction func addPatient(sender: AnyObject) {
        
        
        
    }

    //MARK : TableView DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patients.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PatientCell", forIndexPath: indexPath)
        
        let patient = patients[indexPath.row] as TDPatient
        
        cell.textLabel?.text = "Patient: \(patient.name)"
        cell.detailTextLabel?.text = patient.diagnosisText
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog("SELECTED: \(indexPath.row)")
        
        let nc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PatientNavigation") as! UINavigationController
        
        let vc = nc.viewControllers.first as! PatientViewController
        
        nc.modalTransitionStyle = .CrossDissolve
        vc.patient = patients[indexPath.row]
        vc.isUpdating = true
        self.presentViewController(nc, animated: true, completion: nil)
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let patient = patients[indexPath.row]
            self.confirmDelete(patient, indexPath: indexPath)
        }
    }
    
    func confirmDelete(patient: TDPatient, indexPath: NSIndexPath) {
        let alert = UIAlertController(title: "Delete Patient", message: "Are you sure you want to permanently delete \(patient.name)?", preferredStyle: .ActionSheet)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .Destructive, handler: { (action: UIAlertAction) in
            //handle deletion from table and data
            self.tableView.beginUpdates()
            let patient = self.patients.removeAtIndex(indexPath.row)
            DataManager.deletePatient(patient)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            self.tableView.endUpdates()
            
        })
        
        alert.addAction(deleteAction)
        
        // Support display in iPad
        alert.popoverPresentationController?.sourceView = self.view
        alert.popoverPresentationController?.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
