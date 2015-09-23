//
//  Views17.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views17: C4CanvasController {
    
    var img:C4Image!
    var s:C4Ellipse!
    
    override func setup() {
        img = C4Image("ollie_pic")
        s = C4Ellipse(frame: C4Rect(0, 0, img.height, img.height))
        
        img.center = self.canvas.center
        s.center = C4Point(img.width/2 ,img.height/2)
        img.layer?.mask = s.layer
        self.canvas.add(img)
    }
}
