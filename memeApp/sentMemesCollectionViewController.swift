//
//  sentMemesCollectionViewController.swift
//  memeApp
//
//  Created by Winnie Wen on 2/22/16.
//  Copyright © 2016 Winnie Wen. All rights reserved.
//

import UIKit

class sentMemesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var memes: [Meme]?
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (
            barButtonSystemItem: .Add,
            target: self,
            action: "addMeme")
                
        
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
        
        updateMemes()
    }
    
    
    func updateMemes() {
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        memes = applicationDelegate.memes
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        updateMemes()
        self.collectionView!.reloadData()
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as! memeCollectionCell
        let meme = self.memes![indexPath.row]
        
        cell.collectionImage?.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("memeDetailViewController") as! memeDetailViewController
        
        
        detailController.meme = self.memes![indexPath.row]
        
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
    func addMeme() {
        self.performSegueWithIdentifier("addMemeSegue", sender: self)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes!.count
    }
    
    

}
