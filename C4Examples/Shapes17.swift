//
//  Shapes17.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes17: C4CanvasController {
    
    var rect:C4Rectangle!
    var star:C4Star!
    var patternWidth = Double()
    
    override func setup() {
        //create the square and center it
        let f = C4Rect(0,0,250,250)
        rect = C4Rectangle(frame: f)
        rect.corner = C4Size(10,10)
        rect.center = self.canvas.center
        
        patternWidth = 4*rect.width;
        var dashPattern = [5,20]
        
        //thicken the line and set its dash pattern
        rect.lineWidth = 10.0
        rect.fillColor = C4Color(UIColor.clearColor())
        rect.lineCap = .Round
        rect.lineDashPattern = dashPattern
        //add the line to the canvas
        canvas.add(rect)
        
        //change the dash pattern
        dashPattern[0] = 1
        dashPattern[1] = 10
        
        //create a font for the text shape
        //    f = [C4Font fontWithName:@"ArialRoundedMTBold" size:320];
        
        //create the text shape and center it
        
        star = C4Star(
            center: canvas.center,
            pointCount: 5,
            innerRadius: 50,
            outerRadius: 100)
        
        
        //style the text shape and set its dash pattern
        star.fillColor = C4Color(UIColor.clearColor())
        star.lineWidth = 5.0
        star.lineCap = .Round
        star.lineDashPattern = dashPattern
        //add the text shape to the canvas
        canvas.add(star)
        
        //animate it after a short delay
        let anim = C4ViewAnimation(duration:10.0) {    //duration = 3 minutes (60s * 3 = 180);
            
            self.rect.strokeColor = C4Blue
            self.star.strokeColor = C4Grey
            
            //set the final dash phase to the entire width of the pattern
            self.rect.lineDashPhase = self.patternWidth
            self.star.lineDashPhase = self.patternWidth
            
        }
        
        anim.autoreverses = true
        anim.repeats = true
        
        delay(0.1){
            anim.animate()
        }
        
    }
}