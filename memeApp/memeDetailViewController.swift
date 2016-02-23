//
//  memeDetailViewController.swift
//  memeApp
//
//  Created by Winnie Wen on 2/22/16.
//  Copyright © 2016 Winnie Wen. All rights reserved.
//

import UIKit

class memeDetailViewController: UIViewController {
    
    var meme: Meme!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "editMeme")
        
        
        self.imageView.image = meme.memedImage
        
    
        
    
    
    

}
}
