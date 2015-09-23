//
//  Random02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-18.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Random02: C4CanvasController {
    
    var s1:C4Rectangle!
    
    override func setup() {
        let frame = C4Rect(0,0,100,150)
        s1 = C4Rectangle(frame: frame)
        s1.center = self.canvas.center
        canvas.add(s1)
        s1.addTapGestureRecognizer { (location, state) -> () in
            self.s1.hidden = true
            let randomInt = random(min: 1, max: 10)
            for i in 1...randomInt {
                let pts = [self.s1.center,C4Point(self.s1.center.x+35+Double(i), self.s1.center.y),C4Point(self.s1.center.x+17, self.s1.center.y+35+Double(i))]
                let shape = C4Triangle(pts)
                let a = C4ViewAnimation(duration:1.0) {
                    let v = C4Vector(x: random(min: 1, max: 200), y: random(min: 1, max: 200))
                    let t = C4Transform.makeTranslation(v)

                    shape.transform = t
                }
                self.canvas.add(shape)
                a.autoreverses = true
                a.repeats = true
                a.animate()
            }
        }
        
    }
}