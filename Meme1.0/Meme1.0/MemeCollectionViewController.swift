//
//  MemeCollectionViewController.swift
//  Meme1.0
//
//  Created by Gaston Gasquet on 10/31/15.
//  Copyright © 2015 Gaston Gasquet. All rights reserved.
//

import UIKit


class MemeCollectionViewController: UICollectionViewController {
    
    
    var memes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    let aplicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        memes = aplicationDelegate.memes
    
    
    }
}