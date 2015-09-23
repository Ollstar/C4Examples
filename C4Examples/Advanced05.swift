//
//  Advanced05.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-15.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit


class Advanced05: C4CanvasController {
    override func setup() {
        
        let bigCircle = C4Circle(center: self.canvas.center, radius: 100)
        bigCircle.strokeColor = C4Color(UIColor.clearColor())
        self.canvas.add(bigCircle)
        for _ in 1...50 {
            self.makeCircle()
        }
    }
    
    
    func makeCircle() {
        let circle = C4Circle(center: self.canvas.center, radius: 2)
        self.canvas.add(circle)
        newPlace(circle)
    }
    
    func newPlace(sender: C4Shape) {
        let time = random01()*5
        let a = C4ViewAnimation(duration:time) {
            let r = Double(random(min: 50, max: 100))
            let theta = degToRad(random01()*360)
            sender.center = C4Point((r*cos(theta)) + (self.canvas.width/2), (r*sin(theta)) + (self.canvas.height/2))
        }
        a.animate()
        delay(time) {
            self.newPlace(sender)
        }
    }
}





