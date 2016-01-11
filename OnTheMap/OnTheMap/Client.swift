//
//  Client.swift
//  OnTheMap
//
//  Created by Gaston Gasquet on 1/9/16.
//  Copyright © 2016 Gaston Gasquet. All rights reserved.
//

import Foundation


class Client: NSObject {
    
    // Shared Sessions
    var session: NSURLSession
    
    // Authentication
    
    var sessionID: String? = nil
    var userID: String? = nil
    
    override init() {
        session = NSURLSession.sharedSession()
        super.init()
    }

    func taskForUdacityGETMethod(method: String, completionHandler: (result: AnyObject!, error: NSError?) -> Void) -> NSURLSessionDataTask {
        
        // Build URL
        let urlString = Constants.UdacityBaseURLSecure + method
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        
        // Configure the request
        let task = session.dataTaskWithRequest(request) { data, response, error in
            guard (error == nil) else {
                print("There was an error with your Udacity GET request: \(error)")
                return
            }
            
            // Check for a successful 2XX response */
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else {
                if let response = response as? NSHTTPURLResponse {
                    print("Your Udacity GET request returned an invalid response! Status code: \(response.statusCode)!")
                } else if let response = response {
                    print("Your Udacity GET request returned an invalid response! Response: \(response)!")
                } else {
                    print("Your Udacity GET request returned an invalid response!")
                }
                
                return
                }
            
            // Parse the data */
            let parsedResult: AnyObject!
            do {
                parsedResult = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            } catch {
                parsedResult = nil
                print("Could not parse the data as JSON: '\(data)'")
                return
            }
            
            /* Was there any data returned? */
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }

        }
    
        task.resume()
        return task
    }

        func taskUdacityPostMethod() {
        
        // Build URL
        let urlString = Constants.UdacityBaseURLSecure
        let url = NSURL(string: urlString)
        
        // Configure the request
        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.udacity.com/api/session")!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = "{\"udacity\": {\"username\": \"account@domain.com\", \"password\": \"********\"}}".dataUsingEncoding(NSUTF8StringEncoding)
        let session = NSURLSession.sharedSession()
        
        // Make the request
        let task = session.dataTaskWithRequest(request) { data, response, error in
            guard (error == nil) else {
                print("There was an error with your Udacity POST request: \(error)")
                return
            }

        // Check for a successful 2XX response */
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else {
                if let response = response as? NSHTTPURLResponse {
                    print("Your Udacity POST request returned an invalid response! Status code: \(response.statusCode)!")
                } else if let response = response {
                    print("Your Udacity POST request returned an invalid response! Response: \(response)!")
                } else {
                    print("Your Udacity POST request returned an invalid response!")
                }
                
                return

            }

        // Parse the data */
            let parsedResult: AnyObject!
            do {
                parsedResult = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            } catch {
                parsedResult = nil
                print("Could not parse the data as JSON: '\(data)'")
                return
            }

        }
        task.resume()
        
}

    

}