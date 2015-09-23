//
//  Interaction06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-16.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Interaction06: C4CanvasController {
    
    var s1:C4Circle!
    
    override func setup() {
        s1 = C4Circle(center: self.canvas.center, radius: 50)
        
        let a = s1.addLongPressGestureRecognizer({ (location, state) -> () in
            self.s1.fillColor = C4Color(red: random01(), green: random01(), blue: random01(), alpha: random01())
        })
        a.minimumPressDuration = 2
        canvas.add(s1)
        
        
        
    }
}