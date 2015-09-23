//
//  Shapes07.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-02.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
class Shapes07: C4CanvasController {
    
    var poly1:C4Polygon!
    var poly2:C4Polygon!
    
    override func setup() {
        
        self.createAndStylePolygons()
        self.createLabels()
        
        //define the fill rules for each polygon
        poly1.fillRule =  .NonZero//Default value
        poly1.fillColor = C4Pink
        poly2.fillRule = .EvenOdd;
        poly2.fillColor = C4Pink
        
    }
    
    
    func createAndStylePolygons() {
        
        let polyPoints = [C4Point(), C4Point(150, -150), C4Point(200, -100), C4Point(100, 0), C4Point(0, -100), C4Point(50,-150), C4Point(200,0)]
        
        
        //create poly1 and style it
        poly1 =  C4Polygon(polyPoints)
        poly1.center = C4Point(self.canvas.center.x, self.canvas.height/3);
        
        //create poly2 and style it
        poly2 = C4Polygon(polyPoints)
        poly2.center = C4Point(self.canvas.center.x, self.canvas.height*2/3);
        
        
        
        //add all the polygons to the canvas
        self.canvas.add(poly1)
        self.canvas.add(poly2)
    }
    
    
    func createLabels() {
        
        let f = C4Font(name: "ArialRoundedMTBold", size: 30)
        
        
        //create the FILLNORMAL label, center it to the base of poly1
        let lableNormal =  C4TextShape(text: "FILLNORMAL", font: f)
        
        var center = poly1.center
        center.y += poly1.height/2 + lableNormal.height
        lableNormal.center = center;
        self.canvas.add(lableNormal)
        
        //create the FILLEVENODD label, center it to the base of poly2
        let labelEvenOdd =  C4TextShape(text: "FILLEVENODD", font: f)
        center = poly2.center
        center.y += poly2.height/2 + labelEvenOdd.height
        labelEvenOdd.center = center
        self.canvas.add(labelEvenOdd)
    }
}