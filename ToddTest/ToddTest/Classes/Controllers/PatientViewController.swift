//
//  PatientViewController.swift
//  ToddTest
//
//  Created by Carlos Alcala on 5/30/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import UIKit

class PatientViewController: UIViewController {

    //MARK : Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageStepper: UIStepper!
    @IBOutlet weak var migrainesSwitch: UISwitch!
    @IBOutlet weak var drugsSwitch: UISwitch!
    
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var genderPicker: UIPickerView!
    
    // current patient
    var patient: TDPatient?
    
    //MARK : Controller Lifecycle
    
    override func viewDidLoad() {
        self.genderPicker.hidden = true
        
    }
    
    //MARK : Actions
    
    @IBAction func doneAction(sender: AnyObject) {
     
        //TODO: save or update patient profile
        
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK : Helper Functions
    
    func loadProfile() {
        
        //TODO: load current patient profile
        
    }
    
    
    
}
