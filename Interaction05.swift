//
//  Interaction05.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-16.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Interaction05: CanvasController {
    
    var s1:Circle!
    
    override func setup() {
        s1 = Circle(center: self.canvas.center, radius: 50)
        
        let a = s1.addPanGestureRecognizer { (center, location, translation, velocity, state) -> () in
            self.s1.fillColor = Color(red: random01(), green: random01(), blue: random01(), alpha: random01())
        }
        a.minimumNumberOfTouches = 2
        canvas.add(s1)
        
        
        
    }
}