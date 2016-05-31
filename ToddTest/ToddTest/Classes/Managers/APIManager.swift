//
//  APIManager.swift
//  ToddTest
//
//  Created by Carlos Alcala on 5/30/16.
//  Copyright © 2016 Carlos Alcala. All rights reserved.
//

import Foundation

class APIManager: NSObject {
    
    //REST-API: fetch Patients from backend URL
    class func fetchPatients(completion: (([TDPatient], error: NSError?) -> Void)) {
        
        let patients:[TDPatient] = []

        //TODO: implement Alamofire Library for REST-API URL callbacks
        
//        let url = "http://www.someurl.com/getPatients"
//        Alamofire.request(.GET, url, parameters: ["foo": "bar"])
//            .responseJSON { request, response, result in
//                switch result {
//                case .Success(let JSON):
//                    print("Success with JSON: \(JSON)")
//        
//                      //TODO: parse JSON result to Patients Data Array
//                      patients = self.parsePatients(JSON)
//                      completion(patients, error: nil)
//
//                case .Failure(let data, let error):
//                      print("Request failed with error: \(error)")
//                      completion(nil, error: error)
//                    }
//                }
//        }
        
        
        //complete empty for now
        completion(patients, error: nil)

    }
}
