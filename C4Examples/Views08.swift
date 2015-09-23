//
//  Views08.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views08: C4CanvasController {
    
    var normalImage:C4Image!
    var changedImage:C4Image!
    
    override func setup() {
        
        normalImage = C4Image("ollie_pic")
        normalImage.center = self.canvas.center
        changedImage = C4Image(image: normalImage)
        
        changedImage.height /= 2.0
        //changedImage.width /= 2.0f; //also works!
        changedImage.center = self.canvas.center
        
        self.canvas.add(normalImage)
        self.canvas.add(changedImage)
        
    }
}