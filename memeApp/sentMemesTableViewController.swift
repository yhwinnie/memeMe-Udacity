//
//  sentMemesTableViewController.swift
//  memeApp
//
//  Created by Winnie Wen on 2/22/16.
//  Copyright © 2016 Winnie Wen. All rights reserved.
//

import UIKit

class sentMemesTableViewController: UITableViewController {
    
    var memes: [Meme]?
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem (
            barButtonSystemItem: .Add,
            target: self,
            action: "addMeme")
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem (
            barButtonSystemItem: .Edit,
            target: self,
            action: nil)
        updateMemes()
    }
    
    func updateMemes() {
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        memes = applicationDelegate.memes
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        updateMemes()
        //Reload data
        self.tableView.reloadData()
    }
    
    func addMeme() {
        self.performSegueWithIdentifier("addMemeSegue", sender: self)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("tableCell")!
        
        
        let meme = self.memes![indexPath.row]
        
        cell.textLabel?.text = meme.topText + "-" + meme.bottomText
        cell.detailTextLabel?.text = ""
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath!) {

        
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("memeDetailViewController") as! memeDetailViewController
        
        
        detailController.meme = self.memes![indexPath.row]
        
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    

    
    
    
    

}
