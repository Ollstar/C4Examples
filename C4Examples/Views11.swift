//
//  Views11.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views11: C4CanvasController {
    
    var s1:C4Rectangle!
    var s2:C4Rectangle!
    
    override func setup() {
        
        setupShapes()
        s2.origin = self.canvas.center;
    }
    
    func setupShapes() {
        let rect = C4Rect(0, 0, 150, 300)
        
        s1 = C4Rectangle(frame: rect)
        s1.center = self.canvas.center
        
        s2 = C4Rectangle(frame: rect)
        s2.opacity = 0.75 //Lets change the alpha so we can see which one is which
        self.canvas.add(s1)
        self.canvas.add(s2)
    }
}