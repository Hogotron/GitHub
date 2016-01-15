//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Gaston Gasquet on 1/9/16.
//  Copyright © 2016 Gaston Gasquet. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var tapRecognizer: UITapGestureRecognizer? = nil
    
    @IBAction func login() {
    
    // Start animating an activity indicator until the login process either fails or completes
        
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activityView.center = self.view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
        
        
        
   
    
    
    func viewDidLoad() {
        super.viewDidLoad()
    
                }
        
        func subscribeToKeyboardNotifications() {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        }
        
        func unsubscribeToKeyboardNotifications() {
            NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        }
        
        


}

}