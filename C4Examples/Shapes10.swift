//
//  Shapes10.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-02.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes10: C4CanvasController {
    
    var linePoints = [C4Point]()
    var x1:Double!
    var x2:Double!
    var line1:C4Line!
    var line2:C4Line!
    var line3:C4Line!
    
    
    
    override func setup() {
        
        //create 2 x coordinates
        x1 = (self.canvas.width/4)
        x2 = (self.canvas.width*3/4)
        
        self.setupLines()
        self.setupGridLines()
        self.setupLabels()
    }
    
    func setupLines() {
        
        //set the points for the first line
        linePoints.append(C4Point(x1, self.canvas.height/4))
        linePoints.append(C4Point(x2, self.canvas.height/4))
        
        //create and style the first line (no need to set the lineCap because we show the default here)
        line1 = C4Line(linePoints)
        line1.lineWidth = 30.0
        
        //set the points for the second line
        linePoints[0] = (C4Point(x1, self.canvas.height/2))
        linePoints[1] = (C4Point(x2, self.canvas.height/2))
        
        
        //create and style the second line
        line2 = C4Line(linePoints)
        line2.strokeColor = C4Blue
        line2.lineWidth = 30.0
        line2.lineCap = .Square
        
        //set the points for the third line
        linePoints[0] = (C4Point(x1, self.canvas.height*3/4))
        linePoints[1] = (C4Point(x2, self.canvas.height*3/4))
        
        //create and style the third line
        line3 = C4Line(linePoints)
        line3.strokeColor = C4Pink
        line3.lineWidth = 30.0
        line3.lineCap = .Butt
        
        //add all the lines to the canvas
        self.canvas.add(line1)
        self.canvas.add(line2)
        self.canvas.add(line3)
    }
    
    func setupGridLines() {
        //create a single point array to set as the dash pattern for the grid lines
        //            let dashPattern =
        //            CGFloat dashPattern[1] = {2.0f};
        
        //offset x1 and x2 to sharpen the grid lines
        x1! += 0.5
        x2! += 0.5
        
        var gridLine1:C4Line
        var gridLine2:C4Line
        
        //set the points for the first grid line
        linePoints[0] = (C4Point(x1, 0))
        linePoints[1] = (C4Point(x1, self.canvas.height))
        
        //create the first line and style it with width and a dash pattern
        gridLine1 = C4Line(linePoints)
        gridLine1.lineWidth = 1.0
        gridLine1.lineDashPattern = [2]
        
        
        //set the points for the second grid line
        linePoints[0] = (C4Point(x2, 0))
        linePoints[1] = (C4Point(x2, self.canvas.height))
        
        //create the second line and style it with width and a dash pattern
        gridLine2 = C4Line(linePoints)
        gridLine2.lineWidth = 1.0
        gridLine2.lineDashPattern = [2]
        
        //add the lines to the canvas
        self.canvas.add(gridLine1)
        self.canvas.add(gridLine2)
    }
    
    func setupLabels() {
        //create a font to use for all the labels
        let f = C4Font(name: "ArialRoundedMTBold", size:20)
        
        //create, style and add the first label, with text describing its lineCap type
        var l = C4TextShape(text: "CAPROUND (default)", font: f)
        l.fillColor = C4Color(UIColor.whiteColor())
        l.center = line1.center;
        self.canvas.add(l)
        
        //create, style and add the second label, with text describing its lineCap type
        l = C4TextShape(text: "CAPSQUARE", font: f)
        l.fillColor = C4Color(UIColor.whiteColor())
        l.center = line2.center;
        self.canvas.add(l)
        
        //create, style and add the third label, with text describing its lineCap type
        l = C4TextShape(text: "CAPBUTT", font: f)
        l.fillColor = C4Color(UIColor.whiteColor())
        l.center = line3.center;
        self.canvas.add(l)
        
    }

}