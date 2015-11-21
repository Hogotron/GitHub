//
//  CollectionViewController.swift
//  Meme1.0
//
//  Created by Gaston Gasquet on 11/2/15.
//  Copyright © 2015 Gaston Gasquet. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayOut: UICollectionViewFlowLayout!
    
    var memes: [Meme] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        let space: CGFloat = 1.0
        let dimension = (view.frame.size.width - 2 * space) / 3.0
        flowLayOut.minimumLineSpacing = space
        flowLayOut.minimumInteritemSpacing = space
        flowLayOut.itemSize = CGSizeMake(dimension, dimension)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView!.reloadData()
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return memes.count
        
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("memeCollectionCell", forIndexPath: indexPath) as! CustomMemeCell
        let meme = memes[indexPath.item]
        
        cell.setCellImage(meme.memedImage)
        
        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        // instantiate view MemeDetailViewController
        let detailController = storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as! DetailViewController
        
        // retrieve different meme for different items
        let meme = memes[indexPath.row]
        
        // pass meme and its index to view controller
        detailController.meme = meme
        detailController.memeIndex = indexPath.row
        
        // display view controller
        navigationController?.pushViewController(detailController, animated: true)
    }

        
    
}




