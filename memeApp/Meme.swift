//
//  Meme.swift
//  MemeMe
//
//  Created by Brian Moriarty on 4/5/15.
//  Copyright (c) 2015 Brian Moriarty. All rights reserved.
//

import UIKit

//
// Data model for a Meme
//
class Meme: NSObject {
    var topText: String
    var bottomText: String
    var image: UIImage
    var memedImage: UIImage?
    
    init(topText: String, bottomText: String, image: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.image = image
        self.memedImage = memedImage
    }
}