//
//  Shapes01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Shapes01: C4CanvasController {
    override func setup() {
        
        var rectangle:C4Rectangle!
        var square:C4Rectangle!
        var circle:C4Circle!
        var ellipse:C4Ellipse!
        
        
        //Create a rectangle
        rectangle = C4Rectangle(frame: C4Rect(0,0,200,100))
        
        //Create a square (same w & h)
        square = C4Rectangle(frame: C4Rect(0,0,100,100))
        
        //Create an ellipse
        ellipse = C4Ellipse(frame: rectangle.frame) // same dimensions as rectangle
        
        //Create a circle (same w & h)
        circle = C4Circle(center: C4Point(0,0), radius: 50) // same dimensions as square
        
        //Figure out the vertical whitespace (i.e. the space between shapes and the edges of the canvas)
        var whiteSpace = self.canvas.height - 4 * rectangle.height
        
        whiteSpace = whiteSpace/5 // because there are 5 gaps
        
        //center all the shapes to the canvas
        var center = C4Point()
        center.x = self.canvas.center.x
        
        //set the y position for the rectangle
        center.y = whiteSpace + rectangle.height/2
        rectangle.center = center
        
        //set the y position for the square
        center.y = center.y + whiteSpace + square.height
        square.center = center
        
        //set the y position for the circle
        center.y = center.y + whiteSpace + circle.height
        circle.center = center
        
        //set the y position for the ellipse
        center.y = center.y + whiteSpace + ellipse.height
        ellipse.center = center
        
        //add all the objects to the canvas
        self.canvas.add(rectangle)
        self.canvas.add(square)
        self.canvas.add(circle)
        self.canvas.add(ellipse)
    }
}

