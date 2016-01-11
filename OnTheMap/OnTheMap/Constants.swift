//
//  Constants.swift
//  OnTheMap
//
//  Created by Gaston Gasquet on 1/9/16.
//  Copyright © 2016 Gaston Gasquet. All rights reserved.
//


extension Client {
    
    struct Constants {
        
        
        // MARK: API Parse Key
        static let ParseApiKey: String = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"

        // MARK: Application ID
        static let ParseAppId: String = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
        
        // MARK: Facebook ID
        static let FacebookId: String = "365362206864879"
        
        // MARK: URL
        static let ParseBaseUrl: String = "https://api.parse.com/1/classes/"
        static let UdacityBaseURLSecure: String = "https://www.udacity.com/api/"
    }

    struct Methods {
        
        // MARK: Locations
        static let location = "StudentLocation"
        
        // MARK: Authetication
        static let Session = "Session"
        
        // MARK: Public user data
        static let AuthenticationTokenNew = "authentication/token/new"
        
        
    }

    // MARK: Parameter Keys
    struct ParameterKeys {
        
        static let ApiKey = "X-Parse-REST-API-Key"
        static let ApplicationID = "X-Parse-Application-Id"
        static let limit = "limit"
        static let skip = "skip"
        static let order = "order"
        
    }
    
    // MARK: JSON Body Keys
    struct JSONBodyKeys {
        
        static let udacity = "udacity"
        static let username = "username"
        static let password = "password"
        
        static let LastName = "lastName"
        static let MapString = "mapString"
        static let MediaURL = "mediaURL"
        static let Latitude = "latitude"
        static let Longitude = "longitude"
        static let CreatedAt = "createdAt"
        static let UpdatedAt = "updatedAt"
        static let ACL = "ACL"
        
    }

    // MARK: JSON Response Keys
    struct JSONResponseKeys {
        
        // MARK: General
        static let StatusMessage = "status_message"
        static let StatusCode = "status_code"
        
        // MARK: Authorization
        static let RequestToken = "request_token"
        static let Session = "session"
        static let sessionID = "id"
        
        // MARK: Account
        static let UserID = "id"
        
        // MARK: Student Locations
        static let LocationResults = "results"
        static let CreatedAt = "createdAt"
        static let FirstName = "firstName"
        static let LastName = "lastName"
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let mapString = "mapString"
        static let mediaURL = "mediaURL"
        static let objectID = "objectId"
        static let uniqueKey = "uniqueKey"
        static let updatedAt = "updatedAt"
        
        
    }


}