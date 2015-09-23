//
//  Views10.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views10: C4CanvasController {
    override func setup() {
        let f = C4Rect(0,0,100,100)
        let r = C4Rectangle(frame: f)
        r.center = canvas.center
        canvas.add(r)
        
        canvas.addPanGestureRecognizer { (location, translation, velocity, state) -> () in
            r.center = location
        }
        
    }
}
