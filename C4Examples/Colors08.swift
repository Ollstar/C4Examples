//
//  Colors08.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Colors08: C4CanvasController {
    override func setup() {
        
        //create the pattern images
        //you can get the patterns for this example here: http://www.cocoaforartists.org/files/patterns.zip
        let patternLines = C4Image("white_carbon")
        let patternPyramid = C4Image("white_carbon")
        
        //create the shapes
        let f = C4Rect(0,0,200,200)
        let s1 = C4Rectangle(frame: f)
        let s2 = C4Ellipse(frame: f)
        
        //set their line widths to be quite thick
        s1.lineWidth = 50.0
        s2.lineWidth = s1.lineWidth
        
        //set their fill colors with pattern images
        s1.fillColor = C4Color(UIColor(patternImage: patternPyramid.uiimage))
        s2.fillColor = C4Color(UIColor(patternImage: patternLines.uiimage))
        
        //set their stroke colors with pattern images
        s1.strokeColor = C4Color(UIColor(patternImage: patternPyramid.uiimage))
        s2.strokeColor = C4Color(UIColor(patternImage: patternLines.uiimage))
        
        //position them
        s1.center = C4Point(self.canvas.center.x, self.canvas.height / 3)
        s2.center = C4Point(self.canvas.center.x, self.canvas.height * 2 / 3)
        
        //add them to the canvas
        self.canvas.add(s1)
        self.canvas.add(s2)
    }
}

