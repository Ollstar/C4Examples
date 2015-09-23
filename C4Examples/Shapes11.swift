//
//  Shapes11.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-03.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes11: C4CanvasController {
    
    var poly1:C4Polygon = C4Polygon()
    var poly2:C4Polygon = C4Polygon()
    var poly3:C4Polygon = C4Polygon()
    
    
    override func setup() {
        self.createAndStylePolygons()
        self.createLabels()
        
        //set the lineJoin property for each shape
        poly1.lineJoin = .Miter //This is the default value
        poly2.lineJoin = .Round
        poly3.lineJoin = .Bevel
    }
    
    func createAndStylePolygons() {
        //the base width for the polygons
        let base:CGFloat = 300
        let height = sqrt(3)/4 * base; // half the height of an equilateral
        let polyPoints = [C4Point(),C4Point(150, Int(-height)),C4Point(300, 0)]
        
        //create poly1 and style it
        poly1 = C4Polygon(polyPoints)
        poly1.fillColor = C4Color(UIColor.clearColor())
        poly1.lineWidth = 30.0
        poly1.center = C4Point(self.canvas.center.x, self.canvas.height/4)
        
        //create poly2 and style it
        poly2 = C4Polygon(polyPoints)
        poly2.fillColor = C4Color(UIColor.clearColor())
        poly2.strokeColor = C4Blue
        poly2.lineWidth = 30.0
        poly2.center = self.canvas.center;
        poly2.lineJoin = .Round
        poly2.center = self.canvas.center;
        
        //create poly3 and style it
        poly3 = C4Polygon(polyPoints)
        poly3.fillColor = C4Color(UIColor.clearColor())
        poly3.strokeColor = C4Pink
        poly3.lineWidth = 30.0
        poly3.center = C4Point(self.canvas.center.x, self.canvas.height*3/4);
        
        //add all the polygons to the canvas
        self.canvas.add(poly1)
        self.canvas.add(poly2)
        self.canvas.add(poly3)
    }
    
    func createLabels() {
        let f = C4Font(name: "ArialRoundedMTBold", size:30.0)
        
        //create the JOINMITER label, center it to the base of poly1
        var l = C4TextShape(text: "JOINMITER", font: f)
        var center = poly1.center
        center.y += poly1.height/2;
        l.center = center;
        self.canvas.add(l)
        
        //create the JOINROUND label, center it to the base of poly2
        l = C4TextShape(text: "JOINROUND", font: f)
        center = poly2.center
        center.y += poly2.height/2;
        l.center = center
        self.canvas.add(l)
        
        
        
        //create the JOINBEVEL label, center it to the base of poly3
        l = C4TextShape(text: "JOINBEVEL", font: f)
        center = poly3.center
        center.y += poly3.height/2;
        l.center = center;
        self.canvas.add(l)
        
        
    }
}