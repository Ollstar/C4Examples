//
//  Shapes04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-01.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Shapes04 : C4CanvasController {
    override func setup() {
        
        var arcCenter = self.canvas.center;
        arcCenter.y = self.canvas.height * 1/3
        
        var wedgeCenter = self.canvas.center;
        
        wedgeCenter.y = self.canvas.height * 2/3
        
        
        //create the counter-clockwise arc
        
        let counterClockwiseArc = C4Arc(center: arcCenter,radius: 100, start: M_PI, end: 2*M_PI, clockwise: false)
        
        
        //create the clockwise arc, first shifting the center of the arc
        arcCenter.x += 8
        arcCenter.y += 14
        let clockwiseArc = C4Arc(center: arcCenter,radius: 100, start: M_PI, end: 2*M_PI, clockwise: true)
        
        //create the counter-clockwise wedge
        let counterClockwiseWedge = C4Wedge(center: wedgeCenter, radius: 100, start: M_PI_4 * 3, end: M_PI_4, clockwise: false)
        
        //create the clockwise wedge, first shifting the center of the wedge
        //        wedgeCenter.x += -5;
        wedgeCenter.y += 14;
        let clockwiseWedge = C4Wedge(center: wedgeCenter, radius: 100, start: M_PI_4 * 3, end: M_PI_4, clockwise: true)
        
        //add the shapes to the canvas
        self.canvas.add(counterClockwiseArc)
        self.canvas.add(clockwiseArc)
        self.canvas.add(counterClockwiseWedge)
        self.canvas.add(clockwiseWedge)
        
    }
}