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
    
    var name:String = ""
    var migraines:Bool = false
    var age:Int = 0
    var gender:Gender = .None
    var useDrugs:Bool = false
    
    func create(name: String, migraines: Bool, age: Int, gender: Gender, drugs: Bool) {
        self.name = name
        self.migraines = migraines
        self.age = age
        self.gender = gender
        self.useDrugs = drugs
    }
}
