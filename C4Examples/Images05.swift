//
//  Images05.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//


import C4
import UIKit

class Images05 : C4CanvasController {
    //define 2 invisible images
    var i1:C4Image!
    var i2:C4Image!
    //define a visible image
    var visibleImage:C4Image!
    var isFirstImage:Bool!
    
    
    override func setup() {
        //create two invisible images
        i1 = C4Image("ollie_pic")
        i2 = C4Image("image1")
        
        //create the visible image from the first invisible image
        visibleImage = C4Image(image: i1)
        isFirstImage = true
        
        //position it and add it to the canvas
        visibleImage.center = self.canvas.center
        self.canvas.add(visibleImage)
        
        canvas.addTapGestureRecognizer { (location, state) -> () in
            if self.isFirstImage == true {
                self.visibleImage = C4Image(image: self.i2)
                self.isFirstImage = false
            } else {
                self.visibleImage = C4Image(image: self.i1)//need to change image property of visible image some how....
                self.isFirstImage = true

            }
        }
    }
    
}