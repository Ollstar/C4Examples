//
//  Colors05.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Colors05: C4CanvasController {
    
    var red = C4Rectangle()
    var green = C4Rectangle()
    var blue = C4Rectangle()
    
    override func setup() {
        
        setupShapes()
        setupLabels()
        
        red.fillColor  = C4Color(UIColor(hue: 0.0, saturation: 1.0, brightness: 1.0, alpha: 1.0))
        green.fillColor  = C4Color(UIColor(hue: 0.33, saturation: 1.0, brightness: 1.0, alpha: 1.0))
        blue.fillColor  = C4Color(UIColor(hue: 0.66, saturation: 1.0, brightness: 1.0, alpha: 1.0))

        
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
        let f = C4Font(name: "ArialRoundedMTBold" , size: 25.0)
        var l:C4TextShape!
        
        l = C4TextShape(text: "{HSBA} : {0.0,1.0,1.0,1.0}", font: f)
        l.fillColor = white
        l.center = red.center;
        self.canvas.add(l)
        
        l = C4TextShape(text: "{HSBA} : {0.33,1.0,0,1.0}", font: f)
        l.fillColor = white
        l.center = green.center;
        self.canvas.add(l)
        
        l = C4TextShape(text: "{HSBA} : {0.66,1.0,1.0,1.0}", font: f)
        l.fillColor = white
        l.center = blue.center;
        self.canvas.add(l)
        
        
    }
}