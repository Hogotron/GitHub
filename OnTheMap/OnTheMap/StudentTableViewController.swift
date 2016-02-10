//
//  StudentTableViewController.swift
//  OnTheMap
//
//  Created by Gaston Gasquet on 1/30/16.
//  Copyright © 2016 Gaston Gasquet. All rights reserved.
//

import UIKit


class StudentTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    private struct studentListing {
        var name: String?
        var URL: String?
    }
    
    private var studentListingArray = [studentListing]()
    
    //MARK: - ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: - TableView Delegate methods
    
     func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //MARK: - TableViewDataSource methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("studentInformation", forIndexPath: indexPath) as UITableViewCell
        
        //Configure the cell
        let info = studentListingArray[indexPath.row]
        cell.textLabel?.text = info.name
        cell.detailTextLabel?.text = info.URL
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Defines the number of rows
        
        let count = studentListingArray.count
        return studentListingArray.count
        
    }
    
    
    
    //MARK: Helper methods
    
    func showProgressIndicator() -> UIActivityIndicatorView {
        
        //When downloading new listings display progress indicator
        
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        
        dispatch_async(dispatch_get_main_queue(), {
            
            //Display a progress indicator in the center
            activityView.center = self.view.center
            activityView.startAnimating()
            self.view.addSubview(activityView)
            
        })
        return activityView
        
    }
    
    func unshowProgressIndicator(activityView: UIActivityIndicatorView) {
        
        //When downloading is complete progress indicator
        
        dispatch_async(dispatch_get_main_queue(), {
            activityView.stopAnimating()
            activityView.removeFromSuperview()
            
        })
}

}