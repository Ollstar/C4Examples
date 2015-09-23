//
//  Advanced01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-14.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Advanced01: C4CanvasController {
    
    var arc1:C4Arc!
    var pts = [C4Point]()
    var canvasShapeCount = 0
    
    override func setup() {
        delay(1.0) {
            self.arcDraw()
        }
    }
    
    func arcDraw() {
        
        if(canvasShapeCount == 0) {
            pts.append(self.canvas.center)
            pts.append(C4Point(random01()*self.canvas.width, self.canvas.center.y))
        } else {
            pts[0] = pts[1]
            
            pts[1] = C4Point(random01()*self.canvas.width, self.canvas.center.y);
        }
        
        let up = (canvasShapeCount % 2 == 0) ? true : false
        
        let arc = self.arcBetweenPoints(pts, up: up)
        self.canvas.add(arc)
        canvasShapeCount++
        print(canvasShapeCount)
        delay(0.0) {
            self.animateArc(arc)
        }
        delay(1.0) {
            self.arcDraw()
        }
    }
    
    
    
    func arcBetweenPoints(beginEndPoints:[C4Point] ,up:Bool) -> C4Arc {
        let p1 = beginEndPoints[0]
        let p2 = beginEndPoints[1]
        let radius = abs(p2.x - p1.x)/2
        var center = self.canvas.center
        if(p2.x > p1.x) {
            center.x = p1.x + radius
        } else {
            center.x = p2.x + radius
        }
        
        var startAngle:Double
        if(up == true) {
            
            startAngle = M_PI
        } else {
            startAngle = 0
        }
        let endAngle = startAngle + M_PI
        
        let s = C4Arc(center: center, radius: radius, start: startAngle, end: endAngle, clockwise: true)
        
        s.fillColor = C4Color(UIColor.clearColor())
        
        if(p2.x > p1.x) {
            if(up) {
                s.strokeEnd = 0.0
            } else {
                s.strokeStart = 1.0
            }
        } else {
            if(up) {
                s.strokeStart = 1.0
            } else {
                s.strokeEnd = 0.0
            }
        }
        
        if(up) {
            
            s.strokeColor = C4Pink
        }
        return s
    }
    
    func animateArc(arc:C4Arc) {
        let a = C4ViewAnimation(duration:1.0) {
            
            
            if(arc.strokeStart == 1.0) {
                
                arc.strokeStart = 0.0
            }else {
                
                arc.strokeEnd = 1.0
            }
            
        }
        a.animate()
    
    }
}
