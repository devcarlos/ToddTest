//
//  PatientViewController.swift
//  ToddTest
//
//  Created by Carlos Alcala on 5/30/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import UIKit

class PatientViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //MARK : Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageStepper: UIStepper!
    @IBOutlet weak var migrainesSwitch: UISwitch!
    @IBOutlet weak var drugsSwitch: UISwitch!
    
    @IBOutlet weak var genderButton: UIButton!
    @IBOutlet weak var genderPicker: UIPickerView!
    
    // current patient
    var patient: TDPatient = TDPatient()
    var isUpdating: Bool = false
    
    var genders:[String] = []
    
    //MARK : Controller Lifecycle
    
    override func viewDidLoad() {
        self.genders = ["Male", "Female"]
        self.genderPicker.hidden = true
        
        if isUpdating {
            self.loadPatient()
        }
    }
    
    //MARK : Actions
    
    @IBAction func stepperAction(sender: UIStepper) {
        self.ageLabel.text = String(Int(sender.value))
    }
    

    @IBAction func genderAction(sender: AnyObject) {
        
        if self.genderPicker.hidden {
            self.genderPicker.hidden = false
        }
    }
    
    
    @IBAction func saveAction(sender: AnyObject) {
     
        //save/update patient profile
        self.saveData()
        
        self.diagnosePatient({
            (action: UIAlertAction) in
            self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        })
    }
    
    func diagnosePatient(handler: (action: UIAlertAction) -> Void) {
        
        let diagnose = patient.diagnosisText
        

        let alert = UIAlertController(title: "Patient Diagnosis", message: "\(diagnose)", preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Continue", style: .Default, handler: handler)
        
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancelAction(sender: AnyObject) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK : Helper Functions
    
    func loadPatient() {
        
        //TODO: load current patient profile
        self.nameTextField.text = self.patient.name
        self.ageLabel.text = String(self.patient.age)
        self.ageStepper.value = Double(self.patient.age)
        self.migrainesSwitch.on = self.patient.migraines
        self.drugsSwitch.on = self.patient.useDrugs
        let index = self.patient.gender == .Male ? 0 : 1
        self.genderButton.setTitle(self.patient.gender.rawValue, forState: .Normal)
        self.genderPicker.selectRow(index, inComponent: 0, animated: true)
    }
    
    func saveData() {
        
        let oldName = self.patient.name
        
        self.patient.name = self.nameTextField.text
        self.patient.age = Int(self.ageStepper.value)
        self.patient.migraines = self.migrainesSwitch.on
        self.patient.useDrugs = self.drugsSwitch.on
        
        let gender = genders[self.genderPicker.selectedRowInComponent(0)]
        self.patient.gender = gender == "Male" ? .Male : .Female
        
        //save/update patient core data
        if isUpdating {
            DataManager.updatePatient(self.patient, oldName: oldName)
        } else {
            DataManager.savePatient(self.patient)
        }
        
    }
    
    //MARK : Picker Datasource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genders.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genders[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let gender = genders[row]
        
        if self.genderButton.titleLabel?.text != gender {
            self.genderButton.setTitle(gender, forState: UIControlState.Normal)
            
            self.genderPicker.hidden = true
        }
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: self.genders[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 17)!])
        return attributedString
    }
    
}
