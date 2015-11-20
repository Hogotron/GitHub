//
//  ViewController.swift
//  Meme1.0
//
//  Created by Gaston Gasquet on 9/8/15.
//  Copyright (c) 2015 Gaston Gasquet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
  
    
   
    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topField: UITextField!
    @IBOutlet weak var saveImage: UIBarButtonItem!
    @IBOutlet weak var bottomField: UITextField!
    @IBOutlet weak var toolBar: UIToolbar!
    
    var memeImage: UIImage!
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topField.hidden = true
        bottomField.hidden = true
        
        topField.defaultTextAttributes = memeTextAttributes
        bottomField.defaultTextAttributes = memeTextAttributes
        topField.textAlignment = NSTextAlignment.Center
        bottomField.textAlignment = NSTextAlignment.Center
        topField.text = "TOP"
        bottomField.text = "BOTTOM" 
        
        topField.delegate = self
        bottomField.delegate = self
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        subscribeToKeyboardNotifications()
        tabBarController?.tabBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        unsubscribeFromKeyboardNotifications()
        
        
    }
    
    @IBAction func pickAnImage(sender: AnyObject) {
    
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
        
    }

        
    @IBAction func savingMyImage(sender: AnyObject) {
    
        let memeImage = generateMemedImage()
        let controller = UIActivityViewController(activityItems: [memeImage], applicationActivities: nil)
        presentViewController(controller, animated: true, completion: nil)

        controller.completionWithItemsHandler = {
            (activity: String?, completed: Bool, items: [AnyObject]?, error: NSError?) -> Void in
            if completed {
                self.save()
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
        
        
    }
        
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.image = image
            
            dismissViewControllerAnimated(true, completion: nil)
        
        }
        topField.hidden = false
        bottomField.hidden = false
        
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func pickAnImageFromAlbum (sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
   
    @IBAction func pickAnImageFromCamera (sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
       
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
   let memeTextAttributes = [
    
        NSStrokeColorAttributeName: UIColor.blackColor(),
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "Didot", size: 30)!,
        NSStrokeWidthAttributeName: -3.0
    
    ]
    
    
    func subscribeToKeyboardNotifications() {
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
    
    }
       
    func keyboardWillShow(notification: NSNotification) {
        
        if bottomField.isFirstResponder() {
            view.frame.origin.y -= getKeyboardHeight(notification)
            
        }
        
        
    }
        
    func keyboardWillHide(notification: NSNotification) {
        
        if bottomField.isFirstResponder(){
            view.frame.origin.y += getKeyboardHeight(notification)
        
        }
        
    
    }
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.CGRectValue().height
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
 
    func save() {
        
        let meme = Meme(topTextField: topField.text, bottomTextField: bottomField.text, originalImage: imagePickerView.image, memedImage: generateMemedImage())
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
        toolBar.hidden = true
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    func generateMemedImage() -> UIImage {
        
        UIGraphicsBeginImageContext(view.frame.size)
        view.drawViewHierarchyInRect(view.frame, afterScreenUpdates: true)
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return memedImage
        
    }

    
    


}



