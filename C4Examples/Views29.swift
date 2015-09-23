//
//  Views29.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views29: C4CanvasController {
    
    var s1:C4Rectangle!
    var s2:C4Rectangle!
    
    override func setup() {
        
        setupShapes()
        
        let t = C4Transform.makeTranslation(C4Vector(x: 50, y: 50))
        s2.transform = t
        
        
    }
    
    func setupShapes() {
        let frame = C4Rect(self.canvas.center.x,self.canvas.center.y,50,50)
        s1 = C4Rectangle(frame: frame)
        s2 = C4Rectangle(frame: frame)
        
        s2.strokeColor = C4Pink
        
        self.canvas.add(s1)
        
        self.canvas.add(s2)
        
    }
}