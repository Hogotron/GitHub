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
    @IBOutlet weak var bottomField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        topField.defaultTextAttributes = memeTextAttributes
        bottomField.defaultTextAttributes = memeTextAttributes
        topField.textAlignment = NSTextAlignment.Center
        bottomField.textAlignment = NSTextAlignment.Center
        topField.text = "TOP"
        bottomField.text = "BOTTOM" 
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        topField.hidden = true
        cameraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    }
    
    @IBAction func pickAnImage(sender: AnyObject) {
    
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
        
        
    
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
            topField.hidden = false
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imagePickerView.image = image
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }

    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func pickAnImageFromAlbum (sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
        
    }
   
    @IBAction func pickAnImageFromCamera (sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
       
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
   let memeTextAttributes = [
    
        NSStrokeColorAttributeName: UIColor.blackColor(),
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: UIFont(name: "Didot", size: 30)!,
        NSStrokeWidthAttributeName: -3.0
    
    ]
    
    










}

