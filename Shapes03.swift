//
//  Shapes02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-01.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Shapes03 : CanvasController {

    override func setup() {
        //        Shape *bezierCurve, *quadraticCurve;
        
        //create the end points for the bezier curve
        let bezierEndPoints = [Point(),Point(200,200)]
        
        //create the control points for the bezier curve
        let bezierControlPoints = [Point(-100, 200), Point(300, 0)]
        
        //create the bezier curve
        let bezierCurve = Curve(begin: bezierEndPoints[0], control0: bezierControlPoints[0], control1: bezierControlPoints[1], end: bezierEndPoints[0])
        bezierCurve.center = Point(self.canvas.center.x, self.canvas.height * 1/3);
        
        
        //create the end points for the quadratic curve
        let quadEndPoints = [Point(),Point(200,0)]
        
        //create the controlPoint for the quadratic curve
        let quadControlPoint = Point(100, -200)
        
        //create the quadratic curve
        let quadCurve = QuadCurve(begin: quadEndPoints[0], control: quadControlPoint, end: quadEndPoints[1])
        quadCurve.center = Point(self.canvas.center.x, self.canvas.height * 2/3)
        
        //add the curves to the canvas
        self.canvas.add(bezierCurve)
        self.canvas.add(quadCurve)
        
    }
}