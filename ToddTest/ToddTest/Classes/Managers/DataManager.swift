//
//  DataManager.swift
//  ToddTest
//
//  Created by Carlos Alcala on 5/30/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataManager: NSObject {
    
    // insert New Patient
    class func savePatient(patient: TDPatient) -> Bool {
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // patient entity
        let entity = NSEntityDescription.entityForName("Patient",
            inManagedObjectContext:managedContext)
        let patientData = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: managedContext)
        
        // generate patient data
        patientData.setValue(patient.name, forKey: "name")
        patientData.setValue(patient.age, forKey: "age")
        patientData.setValue(patient.migraines, forKey: "migraines")
        patientData.setValue(patient.useDrugs, forKey: "useDrugs")
        patientData.setValue(patient.gender.rawValue, forKey: "gender")
        
        //save patient data
        do {
            try managedContext.save()
            return true
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return false
    }
    
    // insert New Patient
    class func updatePatient(patient: TDPatient, oldName: String) -> Bool {
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        
        let predicate = NSPredicate(format: "name == %@", oldName)
        
        let fetchRequest = NSFetchRequest(entityName: "Patient")
        fetchRequest.predicate = predicate
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            if results.count > 0 {
                let patientData = results.first!
                patientData.setValue(patient.name, forKey: "name")
                patientData.setValue(patient.age, forKey: "age")
                patientData.setValue(patient.migraines, forKey: "migraines")
                patientData.setValue(patient.useDrugs, forKey: "useDrugs")
                patientData.setValue(patient.gender.rawValue, forKey: "gender")
            }
        } catch {
            print("Error on object update")
        }
        
        //update patient data
        do {
            try managedContext.save()
            return true
            
        } catch let error as NSError  {
            print("Could not update \(error), \(error.userInfo)")
        }
        
        return false
    }
    
    // delete Patient
    class func deletePatient(patient: TDPatient) -> Bool {
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        
        let predicate = NSPredicate(format: "name == %@", patient.name)
        
        let fetchRequest = NSFetchRequest(entityName: "Patient")
        fetchRequest.predicate = predicate
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            if results.count > 0 {
                if let patientObject = results.first {
                    managedContext.deleteObject(patientObject)
                }
            }
        } catch {
            print("Error on object delete")
        }
        
        //update patient data
        do {
            try managedContext.save()
            return true
            
        } catch let error as NSError  {
            print("Could not delete \(error), \(error.userInfo)")
        }
        
        return false
    }
    
    class func fetchPatients() -> [TDPatient] {
        
        var patients:[TDPatient] = []
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        // fetch request
        let fetchRequest = NSFetchRequest(entityName: "Patient")

        
        //save patient data
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            
            print(results)
            
            if results.count > 0 {
                for object in results {
                    
                    let gender = object.valueForKey("gender") as? String
                    
                    let patient = TDPatient()
                    patient.name = object.valueForKey("name") as? String
                    patient.age = object.valueForKey("age") as? Int
                    patient.gender = gender == "Male" ? .Male : .Female
                    patient.migraines = object.valueForKey("migraines") as? Bool
                    patient.useDrugs = object.valueForKey("useDrugs") as? Bool
                    
                    patients.append(patient)
                    
                }
            }
            
            return patients
            
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        return patients
    }

}
