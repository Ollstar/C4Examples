//
//  Views16.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views16: C4CanvasController {
    
    var m:C4Image!
    var img:C4Image!
    
    override func setup() {
        
        img = C4Image("ollie_pic")
        m = C4Image("burnImage")
        
        m.width = img.width
        
        img.layer?.mask = m.layer
        
        img.center = self.canvas.center
        self.canvas.add(img)
    }
}