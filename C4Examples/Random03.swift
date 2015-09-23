//
//  Random03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-18.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Random03: C4CanvasController {
    
    var r:C4Rectangle!
    var g:UIPanGestureRecognizer!
    var reachedMark = false
    
    override func setup() {
        let frame = C4Rect(0,0,250,500)
        r = C4Rectangle(frame: frame)
        r.center = self.canvas.center
        canvas.add(r)
        g = r.addPanGestureRecognizer { (location, translation, velocity, state) -> () in
            var center = self.r.center
            center.x += translation.x
            self.r.center = center
            self.g.setTranslation(CGPointZero, inView: self.canvas.view)
            if self.r.center.x <= self.canvas.width/3 && self.reachedMark == false {
                self.reachedMark = true
                let a = C4ViewAnimation(duration:1.0) {
                self.r.transform.rotate(degToRad(-90), axis: C4Vector(x: 0, y: 1, z: 1))
                }
                a.animate()
            } else if self.r.center.x >= self.canvas.width/3 && self.r.center.x <= (self.canvas.width/3)*2 && self.reachedMark == true {
                let a = C4ViewAnimation(duration:1.0) {
                    self.r.transform.rotate(degToRad(90), axis: C4Vector(x: 0, y: 1, z: 1))
                }
                a.animate()
                self.reachedMark = false
            } else if self.r.center.x >= (self.canvas.width/3)*2 && self.reachedMark == false {
                self.reachedMark = true
                let a = C4ViewAnimation(duration:1.0) {
                    self.r.transform.rotate(degToRad(90), axis: C4Vector(x: 0, y: 1, z: 1))
                }
                a.animate()
            }
        }
        
        
    }
}