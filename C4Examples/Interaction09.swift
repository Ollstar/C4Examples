//
//  Interaction09.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-17.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Interaction09: C4CanvasController {
    
    var s:C4Circle!
    
    override func setup() {
        s = C4Circle(center: self.canvas.center, radius: 50)
        s.center.y = 50
        canvas.add(s)
        
        delay(1.5) {
            self.changeCenter()
        }
        delay(2.5) {
            self.changeCenter()
        }
        delay(3.5) {
            self.changeCenter()
        }
        delay(4.5) {
            self.changeCenter()
        }
        
    }
    
    func changeCenter() {
        self.s.center.y += 100
        self.s.fillColor = C4Color(red: random01(), green: random01(), blue: random01(), alpha: random01())
    }
}
