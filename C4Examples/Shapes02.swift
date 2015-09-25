//
//  Shapes01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-01.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Shapes02 : C4CanvasController {
    override func setup() {
        //create a 2 point array for the line
        let linePts = [C4Point(100,100),C4Point(200,200)]
        let line = C4Line(linePts)
        
        //create a 3 point array for the triangle
        let trianglePts = [C4Point(0,100), C4Point(100,100), C4Point(100,0)]
        let triangle = C4Triangle(trianglePts)
        
        //create a 4 point array for the polygon
        let polygonPts = [C4Point(0,0), C4Point(100,0), C4Point(100,100), C4Point(0,100)]
        let polygon = C4Polygon(polygonPts)
        
        //create an array between 10 and 20 points for the random shape
        var array = [C4Point]()
        
        let randomCount = random(min: 10, max: 20)
        for _ in 0..<randomCount {
            let p = C4Point(random(below:100),random(below:100))
            array.append(p)
        }
        let randomPolygon = C4Polygon()
        randomPolygon.points = array
        
        //Figure out the vertical whitespace (i.e. the space between shapes and the edges of the canvas)
        let ch = canvas.height
        let th = line.height + triangle.height + polygon.height + randomPolygon.height
        var whiteSpace = ch - th
        
        whiteSpace = whiteSpace/5; // because there are 5 gaps
        
        //create a point that will define the center of each shape, aligned to the middle of the canvas
        var center = C4Point()
        center.x = self.canvas.center.x
        
        //set the y position for the line
        center.y = whiteSpace + line.height/2
        line.center = center
        
        //set the y position for the triangle
        center.y = center.y + whiteSpace + triangle.height
        triangle.center = center
        
        //set the y position for the polygon
        center.y = center.y + whiteSpace + polygon.height
        polygon.center = center
        
        //set the y position for the random shape
        center.y = center.y + whiteSpace + randomPolygon.height;
        randomPolygon.center = center;
        
        //add shapes to canvas
        self.canvas.add(line)
        self.canvas.add(triangle)
        self.canvas.add(polygon)
        self.canvas.add(randomPolygon)
        
    }
}