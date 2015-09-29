//
//  New03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-23.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class New03: C4CanvasController {
    
    var s1:C4Circle!
    var s2:C4Rectangle!
    var maxTap = true
    
    override func setup() {
        s1 = C4Circle(center: canvas.center, radius: 50)
        s2 = C4Rectangle(frame: s1.frame)
        canvas.add(s2)
        canvas.add(s1)
        
        s1.addTapGestureRecognizer { (location, state) -> () in
            if self.maxTap {
                self.s1.center = self.s2.frame.max // bottom right corner of s1
                self.s1.opacity = 0.5
                self.maxTap = false
                
            } else {
                self.s1.center = C4Point(random01()*self.canvas.frame.max.x, random01()*self.canvas.frame.max.y)
                self.maxTap = true
            }
        }
        
    }
}