//
//  TDDiagnostic.swift
//  ToddTest
//
//  Created by Carlos Alcala on 5/30/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import Foundation

//Posible Todd Test Diagnosis
enum Diagnosis:Int {
    case NotLikely = 0
    case Possible = 25
    case Likely = 50
    case ReallyLikely = 75
    case ExtremeLikely = 100
}

//Diagnostic Model Class
class TDDiagnostic: NSObject {
    
    class func runTest(pacient: TDPatient) -> Diagnosis {
        
        
        var factorsWeight = 0
        
        // Many patients with this disorder also have migraines
        if (pacient.migraines == true) {
            factorsWeight++
        }
        
        // People 15 years old or younger are more likely to have it
        if pacient.age <= 15 {
            factorsWeight++
        }
        
        // There are more documented cases of men having it than woman
        if pacient.gender == .Male {
            factorsWeight++
        }
        
        //  Usage of hallucinogenic drugs increases the probability
        if pacient.useDrugs == true {
            factorsWeight++
        }
        
        //run test over factors weight
        //For simplicity sake, consider that those are the only factors that lead to a diagnosis, and that they all have the same weight. For example: someone that matches all of those factors is 100% likely to have the disorder. Matching two of them leads to a 50% probability. Matching none means 0% likely to have it.
        switch factorsWeight {
        case 0: return .NotLikely
        case 1: return .Possible
        case 2: return .Likely
        case 3: return .ReallyLikely
        case 4: return .ExtremeLikely
        default: return .NotLikely
        }
    }
}
