//
//  Views04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views04: C4CanvasController {
    
    var s1:C4Rectangle!
    var s2:C4Ellipse!
    
    override func setup() {
        setupShapes()
        s1.center = self.canvas.center
        s2.center = s1.center

    }
    
    func setupShapes() {
        let frame = C4Rect(0,0,100,100)
        
        self.s1 = C4Rectangle(frame: frame)
        self.canvas.add(s1)
        
        self.s2 = C4Ellipse(frame: frame)
        self.canvas.add(s2)
        
    }
}
