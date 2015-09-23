//
//  Views19.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views19: C4CanvasController {
    
    var s:C4Rectangle!
    var img:C4Image!
    
    override func setup() {
        
        img = C4Image("ollie_pic")
        s = C4Rectangle(frame: C4Rect(0,0,400,50))
        img.center = self.canvas.center
        s.center = C4Point(img.width/2 ,img.height/2)
        
        
        
        img.layer?.mask = s.layer
        
        self.canvas.add(img)
        self.img.interactionEnabled = false
        
        let a = C4ViewAnimation(duration: 1.5) {
            self.s.transform.rotate(M_PI)
            
        }
        a.repeats = true
        a.curve = .Linear
        delay(0.1) {
            a.animate()
        }
        
    }
}
