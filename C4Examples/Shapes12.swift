//
//  Shapes12.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-03.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes12: C4CanvasController {
    
    var start:C4Ellipse!
    var end:C4Ellipse!
    var both:C4Ellipse!
    
    override func setup() {
        let shapeFrame = C4Rect(0, 0, self.canvas.height/6, self.canvas.height/6);
        
        //first shape will animate the start to the end
        start = C4Ellipse(frame: shapeFrame)
        start.lineWidth = 30.0
        start.fillColor = C4Color(UIColor.clearColor())
        start.center = C4Point(self.canvas.center.x, self.canvas.height/4);
        self.canvas.add(start)
        
        //second shape will animate the end to the start
        
        end = C4Ellipse(frame: shapeFrame)
        end.strokeColor = C4Blue
        end.lineWidth = 30.0
        end.fillColor = C4Color(UIColor.clearColor())
        end.center = self.canvas.center
        self.canvas.add(end)
        
        
        //third shape will animate the start and end to a mid-point
        both = C4Ellipse(frame: shapeFrame)
        both.lineWidth = 30.0
        both.strokeColor = C4Pink
        both.fillColor = C4Color(UIColor.clearColor())
        both.center = C4Point(self.canvas.center.x, self.canvas.height*3/4);
        self.canvas.add(both)
       
        let anim1 = C4ViewAnimation(duration:2.0) {
            self.start.strokeStart = 1
        }
        let anim2 = C4ViewAnimation(duration:2.0) {
            self.end.strokeEnd = 0
        }
        let anim3 = C4ViewAnimation(duration:2.0) {
            self.both.strokeStart = 0.5
            self.both.strokeEnd = 0.5
        }
        
        let grp = C4ViewAnimationGroup(animations: [anim1, anim2, anim3])

        anim1.repeats = true
        anim1.autoreverses = true
        anim2.repeats = true
        anim2.autoreverses = true
        anim3.repeats = true
        anim3.autoreverses = true


        
        delay(0.1){
            grp.animate()
        }
    }

}