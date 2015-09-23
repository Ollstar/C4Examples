//
//  Colors10.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-17.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Colors10: C4CanvasController {
    
    //this example should show c4color from hexValue
    
    override func setup() {
        let c = C4Color(0xFF0012FF)
        let s1 = C4Circle(center: self.canvas.center, radius: 50)
        s1.fillColor = c
        canvas.add(s1)
    }
}