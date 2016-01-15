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

    // Mark: Get
    func taskForUdacityGETMethod(method: String, completionHandler: (result: AnyObject!, error: NSError?) -> Void) -> NSURLSessionDataTask {
        
        // Build URL
        let urlString = Constants.UdacityBaseURLSecure + method
        let url = NSURL(string: urlString)!
        let request = NSURLRequest(URL: url)
        
        // Make Request
        let task = session.dataTaskWithRequest(request) {(data, response, error) in
        
        // Check for error
            guard (error == nil) else {
                print("There was an error with your Udacity GET request: \(error)")
                return
            }
        
        // Check for success 2xx response
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else {
                if let response = response as? NSHTTPURLResponse {
                    print("Your Udacity GET request returned an invalid response! Status code: \(response.statusCode)!")
                } else if let response = response {
                    print("Your Udacity GET request returned an invalid response! Response: \(response)!")
                } else {
                    print("Your Udacity GET request returned an invalid response!")
                }
                
                completionHandler(result: nil, error: error)
                return
            }
            
        // Was there any data returned?
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }

        // Parse the data
            let parsedRsult: AnyObject!
            do {
                parsedRsult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            } catch {
                parsedRsult = nil
                print("Could not parse the data as JSON: '\(data)'")
                
                return
            
            }
        
        }
        
        // Start the request
        task.resume()
        return task
        
    }

    func taskForParseGETMethod(method: String, parameters: [String : AnyObject], completionHandler: (result: AnyObject!, error: NSError?) -> Void) -> NSURLSessionDataTask {
    
        // Build URL
        let urlString = Constants.UdacityBaseURLSecure + method
        let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(URL: NSURL(string: "https://api.parse.com/1/classes/StudentLocation")!)
        request.addValue("QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr", forHTTPHeaderField: "X-Parse-Application-Id")
        request.addValue("QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY", forHTTPHeaderField: "X-Parse-REST-API-Key")


        // Make request
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            // Check for error
            guard (error == nil) else {
                print("There was an error with your Parse GET request: \(error)")
                return
            }
            
            // Check for a successful 2XX response
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else {
                if let response = response as? NSHTTPURLResponse {
                    print("Your Parse GET request returned an invalid response! Status code: \(response.statusCode)!")
                } else if let response = response {
                    print("Your Parse GET request returned an invalid response! Response: \(response)!")
                } else {
                    print("Your Parse GET request returned an invalid response!")
                }
                
                completionHandler(result: nil, error: error)
                return
            }
            
            // Was there any data returned?
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }
            
            //  Parse the data and use the data (happens in completion handler)
            let parsedRsult: AnyObject!
            do {
                parsedRsult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            } catch {
                parsedRsult = nil
                print("Could not parse the data as JSON: '\(data)'")
                
                return
            
            }
            
        }

            // Start the request
            task.resume()
            return task
    }
    
    
    }

    // MARK: POST
    func taskForUdacityPOSTMethod(method: String, jsonBody: [String:AnyObject], completionHandler: (result: AnyObject!, error: NSError?) -> Void) -> NSURLSessionDataTask {
        
        // Build URL
        let urlString = Constants.UdacityBaseURLSecure + method
        let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(URL: NSURL(string: "https://www.udacity.com/api/session")!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = "{\"udacity\": {\"username\": \"account@domain.com\", \"password\": \"********\"}}".dataUsingEncoding(NSUTF8StringEncoding)
        do {
            request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(jsonBody, options: .PrettyPrinted)
        }
        
        // Make the request
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            // GUARD: Was there an error?
            guard (error == nil) else {
                print("There was an error with your Udacity POST request: \(error)")
                return
            }
            
            // GUARD: Did we get a successful 2XX response?
            guard let statusCode = (response as? NSHTTPURLResponse)?.statusCode where statusCode >= 200 && statusCode <= 299 else {
                if let response = response as? NSHTTPURLResponse {
                    print("Your Udacity POST request returned an invalid response! Status code: \(response.statusCode)!")
                } else if let response = response {
                    print("Your Udacity POST request returned an invalid response! Response: \(response)!")
                } else {
                    print("Your Udacity POST request returned an invalid response!")
                }
                
                completionHandler(result: response, error: error)
                return
            }
            
            // GUARD: Was there any data returned?
            guard let data = data else {
                print("No data was returned by the request!")
                return
            }

            //  Parse the data and use the data (happens in completion handler)
            let parsedRsult: AnyObject!
            do {
                parsedRsult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            } catch {
                parsedRsult = nil
                print("Could not parse the data as JSON: '\(data)'")
                
                return
                
            }
            
        }
        
        // Start the request
        task.resume()
        return task

}




        // MARK: Helper functions
        
    func escapedParameters(parameters: [String : AnyObject]) -> String {
            
            var urlVars = [String]()
            
            for (key, value) in parameters {
                
                /* Make sure that it is a string value */
                let stringValue = "\(value)"
                
                /* Escape it */
                let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
                
                /* Append it */
                urlVars += [key + "=" + "\(escapedValue!)"]
                
            }
            
            return (!urlVars.isEmpty ? "?" : "") + urlVars.joinWithSeparator("&")
        }

        /* Helper: Substitute the key for the value that is contained within the method name */
        func subtituteKeyInMethod(method: String, key: String, value: String) -> String? {
            if method.rangeOfString("{\(key)}") != nil {
                return method.stringByReplacingOccurrencesOfString("{\(key)}", withString: value)
            } else {
                return nil
            }
        }
        
        /* Helper: Given raw JSON, return a usable Foundation object */
        func parseJSONWithCompletionHandler(data: NSData, completionHandler: (result: AnyObject!, error: NSError?) -> Void) {
            
            var parsedResult: AnyObject!
            do {
                parsedResult = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)
            } catch {
                let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
                completionHandler(result: nil, error: NSError(domain: "parseJSONWithCompletionHandler", code: 1, userInfo: userInfo))
            }
            
            completionHandler(result: parsedResult, error: nil)
        }
        
        
        
        // MARK: Shared Instance
        
        func sharedInstance() -> Client {
            
            struct Singleton {
                static var sharedInstance = Client()
            }
            
            return Singleton.sharedInstance
        }
        
        

        
        
        
        
        



