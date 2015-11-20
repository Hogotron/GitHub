//
//  MemeDetailViewController.swift
//  Meme1.0
//
//  Created by Gaston Gasquet on 11/20/15.
//  Copyright © 2015 Gaston Gasquet. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var memeImageView: UIImageView!
    
    var meme: Meme!
    var memeIndex: Int!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        memeImageView.image = meme.memedImage
        
        navigationController?.navigationBarHidden = false
        
        tabBarController?.tabBar.hidden = true
        
        
    }

    @IBAction func editMeme(sender: UIBarButtonItem) {
        
        let memeEditorViewController = storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        memeEditorViewController.memeToEdit = meme
        memeEditorViewController.memeToEditIndex = memeIndex
        
        navigationController?.pushViewController(memeEditorViewController, animated: true)
    }

    @IBAction func deleteMeme(sender: UIBarButtonItem) {
        
        (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(memeIndex)
        
        navigationController?.popToRootViewControllerAnimated(true)
        
    }


}









