//
//  New01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-23.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class New01: C4CanvasController {
    
    var r1:C4Rectangle!
    var r2:C4Rectangle!
    var g:UIPanGestureRecognizer!
    
    override func setup() {
        let frame = C4Rect(0,0,100,100)
        r1 = C4Rectangle(frame: frame)
        r2 = C4Rectangle(frame: frame)
        var center = canvas.center
        center.y -= 100
        r1.center = center
        center.y += 200
        r2.center = center
        canvas.add(r1)
        canvas.add(r2)
        g = r1.addPanGestureRecognizer { (location, translation, velocity, state) -> () in
            var center = self.r1.center
            center.y += translation.y
            center.x += translation.x
            self.r1.center = center
            self.g.setTranslation(CGPointZero, inView: self.canvas.view)
            if self.r2.frame.intersects(self.r1.frame) {
                self.r2.fillColor = C4Purple
            }
            
        }
        
    }
}