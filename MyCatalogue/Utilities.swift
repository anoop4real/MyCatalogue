//
//  Utilities.swift
//  MyCatalogue
//
//  Created by anoopm on 17/07/16.
//  Copyright © 2016 anoopm. All rights reserved.
//

import UIKit

class Utilities {
    
    static let sharedUtilities = Utilities()
    
    
    func getMenuArrayFromPlistFor(identifier:String)->Array<String>{
        
        let path = Bundle.main.path(forResource: "MenuOptions", ofType: "plist")
        let menuDict = NSDictionary(contentsOfFile: path!)
        
        return (menuDict?.object(forKey: identifier))! as! Array<String>
    }
    
    // Method to build query string from dictionary of parameters
    func buildQueryString(fromDictionary parameters: [String:String]) -> String {
        var urlVars:[String] = []
        
        for (key, value) in parameters {
            if let encodedValue = value.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                urlVars.append(key + "=" + encodedValue)
            }
        }
        let url = urlVars.isEmpty ? "" : "?" + urlVars.joined(separator: "&")
        return kAppBaseURL+url
    }

}
