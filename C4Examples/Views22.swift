//
//  Views22.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views22: C4CanvasController {
    
    var s1:C4Rectangle!
    var s2:C4Rectangle!
    
    override func setup() {
        
        setupShapes()
        s2.transform.rotate(M_PI/2)
    }
    
    func setupShapes() {
        let rect = C4Rect(0, 0, 300, 75);
        
        s1 = C4Rectangle(frame: rect)
        s2 = C4Rectangle(frame: rect)
        s2.strokeColor = C4Pink
        
        let currentCenter = self.canvas.center
        s1.center = currentCenter
        s2.center = currentCenter
        
        self.canvas.add(s1)
        self.canvas.add(s2)
        
    }
}
