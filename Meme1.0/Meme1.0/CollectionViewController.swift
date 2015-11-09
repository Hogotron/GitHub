//
//  CollectionViewController.swift
//  Meme1.0
//
//  Created by Gaston Gasquet on 11/2/15.
//  Copyright © 2015 Gaston Gasquet. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    memes = applicationDelegate.memes
        
        
    }

    
}