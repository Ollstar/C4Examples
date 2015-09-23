//
//  Shapes06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-02.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Shapes06 : C4CanvasController {
    
    var defaultColorShape:C4Ellipse!
    var customColorShape:C4Ellipse!
    
    override func setup() {
        
        var p:C4Point = self.canvas.center;
        
        //create and position the shape with default colors
        let r = C4Rect(0,0,200,200)
        defaultColorShape = C4Ellipse(frame: r)
        p.y = self.canvas.height / 3;
        defaultColorShape.center = p;
        
        //create and position the shape with custom colors
        customColorShape = C4Ellipse(frame: r)
        p.y = self.canvas.height * 2 / 3
        customColorShape.center = p
        
        //set the fill and stroke colors for the custom shape
        customColorShape.fillColor = C4Color.init(UIColor.grayColor())
        customColorShape.strokeColor = C4Color.init(UIColor.greenColor())
        
        //add the shapes to the canvas
        self.canvas.add(defaultColorShape)
        self.canvas.add(customColorShape)
        
        
    }
}