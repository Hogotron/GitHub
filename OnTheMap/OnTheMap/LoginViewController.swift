//
//  LoginViewController.swift
//  OnTheMap
//
//  Created by Gaston Gasquet on 1/24/16.
//  Copyright © 2016 Gaston Gasquet. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate {
    
    var session: NSURLSession!
    var appDelegate: AppDelegate!
    
    /* Outlets */
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var facebookLoginButton: UIButton!
    
    /* View lifecycle functions */
    override func viewDidLoad() {
        super.viewDidLoad()
        
    /* Get the shared URL session */
        session = NSURLSession.sharedSession()
        
    /* Get the app delegate */
        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
}
    func ViewWillAppear(animated: Bool) {
        super.viewWillAppear(true)

        hideNavigationBar()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
    
        navigationController?.navigationBar.hidden = false
    }

    /* Actions */
    @IBAction func loginButton(sender: UIButton) {
    
        let activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activityView.center = self.view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
        
        UdacityClient.sharedInstance().postSession(emailTextField.text!, password: passwordTextField.text!) { (sessionID, error) in
            
            if let sessionID = sessionID {
                
                dispatch_async(dispatch_get_main_queue(), {
                    activityView.stopAnimating()
                    activityView.removeFromSuperview()
                })
                print("Successful login for Session \(sessionID)")
                UdacityClient.sharedInstance().sessionID = sessionID
                self.completeLogin()
                
            } else {
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.shakeScreen()
                    activityView.stopAnimating()
                    activityView.removeFromSuperview()
                    let alert = UIAlertController(title: "Error", message: "Invalid login or password", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                })
                if let error = error {
               
                    print("Login failure due to error: \(error)")

                
                } else {
                    print("Login failure - no session ID or error returned")
                
                    
                }
               
            }
            
            
        }
        
        
    }

    func completeLogin() {
        dispatch_async(dispatch_get_main_queue(), {
            
            let tabViewController = self.storyboard!.instantiateViewControllerWithIdentifier("TabBarController")
            self.presentViewController(tabViewController, animated: true, completion: nil)
        })
    }
    
    @IBAction func signUpButton(sender: UIButton) {
    
        UIApplication.sharedApplication().openURL(NSURL(string: "https://www.udacity.com/account/auth#!/signin")!)
    }
    
    
    func hideNavigationBar() {
        navigationController?.navigationBar.hidden = true
    }

    func enableButtons(sender:UIButton) {
        loginButton.enabled = true
        signUpButton.enabled = true
        sender.alpha = 1.0
    }

    func disableButtons(sender: UIButton) {
        loginButton.enabled = true
        signUpButton.enabled = true
        sender.alpha = 1.0
    }

    //MARK: -- Error helper functions
    
    //Functions that presents an alert to the user with a reason as to why their login failed
    func showAuthenticationAlert(errorString: String){
        let titleString = "Authentication failed!"
        var errorString = errorString
        
        if errorString.rangeOfString("400") != nil{
            errorString = "Please enter your email address and password."
        } else if errorString.rangeOfString("403")  != nil {
            errorString = "Wrong email address or password entered."
        } else if errorString.rangeOfString("1009") != nil {
            errorString = "Something is wrong with the network connection."
        } else {
            errorString = "Something went wrong! Try again"
        }
        
        showAlert(titleString, alertMessage: errorString, actionTitle: "Try again")
    }

    //Function that configures and shows an alert
    func showAlert(alertTitle: String, alertMessage: String, actionTitle: String){
        
        /* Configure the alert view to display the error */
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .Default, handler: nil))
        
        /* Present the alert view */
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    //Function that animates the screen to show login has failed
    func shakeScreen(){
        
        /*Configure a shake animation */
        let shakeAnimation = CABasicAnimation(keyPath: "position")
        shakeAnimation.duration = 0.07
        shakeAnimation.repeatCount = 4
        shakeAnimation.autoreverses = true
        shakeAnimation.fromValue = NSValue(CGPoint: CGPointMake(self.mainView.center.x - 10, self.mainView.center.y - 10))
        shakeAnimation.toValue = NSValue(CGPoint: CGPointMake(self.mainView.center.x + 10, self.mainView.center.y + 10))
        
        /* Shake the view */
        self.mainView.layer.addAnimation(shakeAnimation, forKey: "position")
    }
    
    //MARK: -- Text field delegate functions
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }













}

    
    

