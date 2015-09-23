//
//  Shapes16.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes16: C4CanvasController {
    
    var circle:C4Circle!
    var patternWidth = Double()
    
    override func setup() {
        
        //create the circle and center it
        circle = C4Circle(center: self.canvas.center, radius: 150)
        
        
        //create a dash pattern
        //this pattern is [1,2,3,..,628];
        var dashPattern = [CGFloat]()
        for i in 0..<628 {
            dashPattern.append(CGFloat(i + 1))
            patternWidth += Double(i)
            
        }
        
        //thicken the line and set its dash pattern
        circle.lineWidth = 10.0
        circle.fillColor = C4Color(UIColor.clearColor())
        circle.lineDashPattern = dashPattern
        //add the line to the canvas
        self.canvas.add(circle)
        //animate it after a short delay
        let anim = C4ViewAnimation(duration:180.0) {    //duration = 3 minutes (60s * 3 = 180);
            
            self.circle.strokeColor = C4Blue
            //set the final dash phase to the entire width of the pattern
            self.circle.lineDashPhase = self.patternWidth
        }
        
        anim.autoreverses = true
        
        delay(0.1){
            anim.animate()
        }
    }
    
}