//
//  Advanced07.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-15.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Advanced07: C4CanvasController {
    
    var bigCircle:C4Circle!
    
    override func setup() {
        makeBigCircle()
    }
    
    func makeBigCircle() {
        bigCircle = C4Circle(center: self.canvas.center, radius: 150)
        bigCircle.strokeColor = C4Color(UIColor.clearColor())
        self.canvas.add(bigCircle)
        
        for _ in 0..<100 {
            self.makeCircle()
        }
        let a = C4ViewAnimation(duration:10) {
            self.bigCircle.transform.rotate(M_PI)
            self.bigCircle.fillColor = C4Pink
        }
        a.repeats = true
        a.autoreverses = true
        a.animate()
        
        
    }
    func makeCircle() {
        let circle = C4Circle(center: C4Point(bigCircle.width/2, bigCircle.height/2), radius: 2)
        self.bigCircle.add(circle)
        newPlace(circle)
    }
    
    func newPlace(sender:C4Shape) {
        let time = random01()*10
        let a = C4ViewAnimation(duration:time) {
            let r = Double(random(min: 1, max: 100))
            let theta = degToRad(random01()*360)
            sender.center = C4Point((r*cos(theta)) + (self.bigCircle.width/2), (r*sin(theta)) + (self.bigCircle.height/2))
        }
        a.animate()
        delay(time) {
            self.newPlace(sender)
        }
        
    }
}

