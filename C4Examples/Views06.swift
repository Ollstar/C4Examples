//
//  Views06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views06: C4CanvasController {
    
    var image1:C4Image!
    var image2:C4Image!
    
    override func setup() {

    setupShapes()
    
    //you can change the frame of images and movies in the following way
    image2.frame = C4Rect(image1.center.x, image1.center.y, 400, 160)
    }
    
    func setupShapes() {
        image1 = C4Image("ollie_pic")
        image2 = C4Image("ollie_pic")
    
        image1.center = self.canvas.center;
    
    self.canvas.add(image1)
    self.canvas.add(image2)
    }
    
}
