//
//  Colors04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Colors04: C4CanvasController {
    
    var red = C4Shape()
    var green = C4Shape()
    var blue = C4Shape()
    
    override func setup() {
        
        setupShapes()
        setupLabels()
        
        red.fillColor  = C4Color(UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
        green.fillColor  = C4Color(UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0))
        blue.fillColor  = C4Color(UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0))
        
    }
    
    func setupShapes() {
        let frame = C4Rect(0, 0, self.canvas.width*0.9, self.canvas.height/5.0)
        red =  C4Rectangle(frame: frame)
        green = C4Rectangle(frame: frame)
        blue = C4Rectangle(frame: frame)
        
        red.lineWidth = 0.0
        green.lineWidth = 0.0
        blue.lineWidth = 0.0
        
        red.center  = C4Point(self.canvas.center.x, self.canvas.height/4)
        green.center = C4Point(self.canvas.center.x, self.canvas.height*2/4)
        blue.center = C4Point(self.canvas.center.x, self.canvas.height*3/4)
        
        self.canvas.add(red)
        self.canvas.add(green)
        self.canvas.add(blue)
    }
    
    func setupLabels() {
        let f = C4Font(name: "ArialRoundedMTBold" , size: 30.0)
        var l:C4TextShape!
        
        l = C4TextShape(text: "{RGBA} : {1.0,0,0,1.0}", font: f)
        l.fillColor = white
        l.center = red.center;
        self.canvas.add(l)
        
        l = C4TextShape(text: "{RGBA} : {0,1.0,0,1.0}", font: f)
        l.fillColor = white
        l.center = green.center;
        self.canvas.add(l)
        
        l = C4TextShape(text: "{RGBA} : {0,0,1.0,1.0}", font: f)
        l.fillColor = white
        l.center = blue.center;
        self.canvas.add(l)
        
        
    }
}
