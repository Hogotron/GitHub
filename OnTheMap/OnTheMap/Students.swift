//
//  Students.swift
//  OnTheMap
//
//  Created by Gaston Gasquet on 1/10/16.
//  Copyright © 2016 Gaston Gasquet. All rights reserved.
//

import UIKit


struct Students {
    
    var objectid: String? = nil
    var uniqueKey: String? = nil
    var firstName: String? = nil
    var lastName: String? = nil
    var mapString: String? = nil
    var mediaURL: String? = nil
    var latitude: Double? = nil
    var longitude: Double? = nil
    
    
    init(dictionary: [String: AnyObject]) {
        
        objectid = dictionary[Client.JSONResponseKeys.objectID] as? String
        uniqueKey = dictionary[Client.JSONResponseKeys.uniqueKey] as? String
        firstName = dictionary[Client.JSONResponseKeys.FirstName] as? String
        lastName = dictionary[Client.JSONResponseKeys.LastName] as? String
        mapString = dictionary[Client.JSONResponseKeys.mapString] as? String
        mediaURL = dictionary[Client.JSONResponseKeys.mediaURL] as? String
        latitude = dictionary[Client.JSONResponseKeys.latitude] as? Double
        longitude = dictionary[Client.JSONResponseKeys.longitude] as? Double
        
    }
    
}


