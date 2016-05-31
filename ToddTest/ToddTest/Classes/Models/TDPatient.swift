//
//  TDPatient.swift
//  ToddTest
//
//  Created by Carlos Alcala on 5/30/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import Foundation

//Pacient Gender Enum
enum Gender:String{
    case Male = "Male"
    case Female = "Female"
    case None = "None"
}

//Pacient Model Class
class TDPatient: NSObject {
    
    var name:String!
    var migraines:Bool!
    var age:Int!
    var gender:Gender!
    var useDrugs:Bool!
    
    override init() {
        self.name = ""
        self.migraines = false
        self.age = 0
        self.gender = .None
        self.useDrugs = false
    }
    
    init(name: String, migraines: Bool, age: Int, gender: Gender, drugs: Bool) {
        self.name = name
        self.migraines = migraines
        self.age = age
        self.gender = gender
        self.useDrugs = drugs
    }
    
    var diagnosis:Diagnosis {
        get{
            return TDDiagnostic.runTest(self)
        }
    }
    
    var diagnosisText:String! {
        get{
            let percentage:Int = self.diagnosis.rawValue
            return "\(percentage)% Probability of Todd Syndrome"
        }
    }
    
    // check diagnostic
    func runTest() -> Diagnosis {
        
        return TDDiagnostic.runTest(self)
    }
    
}
