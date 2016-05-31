//
//  ToddTestTests.swift
//  ToddTestTests
//
//  Created by Carlos Alcala on 5/30/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import XCTest
@testable import ToddTest

class ToddTestTests: XCTestCase {
    
    var patient:TDPatient! = nil
    
    override func setUp() {
        super.setUp()
        self.patient = TDPatient(name: "Carlos Alcala", migraines: true, age: 15, gender: .Male, drugs: true)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPatient() {
        XCTAssert(self.patient != nil, "NOT Valid Patient")
    }
    
    func testPatientName() {
        XCTAssert(self.patient.name == "Carlos Alcala", "NOT Patient Name")
    }

    func testPatientMigraines() {
        XCTAssert(self.patient.migraines == true, "NOT Patient Migraines")
    }

    func testPatientAge() {
        XCTAssert(self.patient.age == 15, "NOT Patient Correct Age")
    }
    
    func testPatientGender() {
        XCTAssert(self.patient.gender == .Male, "NOT Patient Gender")
    }
    
    func testPatientUseDrugs() {
        XCTAssert(self.patient.useDrugs == true, "NOT Patient Use Drugs")
    }
    
    func testExtremeDiagnosis() {
        XCTAssert(self.patient.diagnosis == Diagnosis.ExtremeLikely, "NOT 100% Probability Todd Syndrome Diagnosis")
    }
    
    func testReallyLikelyDiagnosis() {
        let patient2 = TDPatient(name: "Patient 2", migraines: false, age: 15, gender: .Male, drugs: true)
        XCTAssert(patient2.diagnosis == Diagnosis.ReallyLikely, "NOT 75% Probability Todd Syndrome Diagnosis")
    }
    
    func testLikelyDiagnosis() {
        let patient3 = TDPatient(name: "Patient 3", migraines: false, age: 20, gender: .Male, drugs: true)
        XCTAssert(patient3.diagnosis == Diagnosis.Likely, "NOT 50% Probability Todd Syndrome Diagnosis")
    }
    
    func testPossibleDiagnosis() {
        let patient4 = TDPatient(name: "Patient 4", migraines: false, age: 20, gender: .Female, drugs: true)
        XCTAssert(patient4.diagnosis == Diagnosis.Possible, "NOT 25% Probability Todd Syndrome Diagnosis")
    }

    func testNotLikelyDiagnosis() {
        let patient5 = TDPatient(name: "Patient 5", migraines: false, age: 20, gender: .Female, drugs: false)
        XCTAssert(patient5.diagnosis == Diagnosis.NotLikely, "NOT 0% Probability Todd Syndrome Diagnosis")
    }
    
    
}
