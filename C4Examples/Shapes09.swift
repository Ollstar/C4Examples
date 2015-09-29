//
//  Shapes09.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-02.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
class Shapes09: C4CanvasController {

    
    override func setup() {
        
        //create a set of default points for all the lines
        let linePoints = [
            C4Point(canvas.center.x-100, canvas.center.y), C4Point(canvas.center.x+100, canvas.center.y),
        C4Point(canvas.center.x+100, canvas.center.y)
    ]
    
        
        
        //create each line and style it, if necessary
        let line1 = C4Line(linePoints)
        
        let line2 = C4Line(linePoints)
//        line2.strokeColor = C4Blue
        
        let line3 = C4Line(linePoints)
//        line3.strokeColor = C4Pink
        
        //add all the lines to the canvas
        self.canvas.add(line1)
        self.canvas.add(line2)
        self.canvas.add(line3)
        
        //animate them after a short delay
        
        let anim = C4ViewAnimation(duration:1.0) {
            line1.endPoints = (line1.endPoints.0,C4Point(line1.endPoints.0.x, line1.endPoints.0.y-100))

           line2.endPoints = (C4Point(line2.endPoints.1.x, line2.endPoints.1.y+100), line2.endPoints.1)

        }
        
        anim.repeats = true
        anim.autoreverses = true
        
        delay(1.0){
            anim.animate()
        }
    }
    
}