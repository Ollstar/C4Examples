//
//  Colors09.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Colors09: C4CanvasController {
    
    var red:C4Rectangle!
    var blue:C4Rectangle!
    var grey:C4Rectangle!
    var redColorComponents:[Double]!
    var blueColorComponents:[Double]!
    var greyColorComponents:[Double]!
    
    override func setup() {
        setupShapes()
        
        //strings will be created from these numbers in the setupLabels method
        setupLabels()
    }
    
    func setupShapes() {
        let frame = C4Rect(0, 0, self.canvas.width*0.9, self.canvas.height/5.0)
        red =  C4Rectangle(frame: frame)
        blue =  C4Rectangle(frame: frame)
        grey =  C4Rectangle(frame: frame)
        
        red.fillColor  = C4Pink
        blue.fillColor = C4Blue
        grey.fillColor = C4Grey
        
        red.lineWidth = 0.0
        blue.lineWidth = 0.0
        grey.lineWidth = 1.0
        grey.strokeColor = lightGray//allows us to see the 3rd rectangle
        
        red.center  = C4Point(self.canvas.center.x, self.canvas.height/4)
        blue.center = C4Point(self.canvas.center.x, self.canvas.height*2/4)
        grey.center = C4Point(self.canvas.center.x, self.canvas.height*3/4)
        
        self.canvas.add(red)
        self.canvas.add(blue)
        self.canvas.add(grey)
        
    }
    
    func setupLabels() {
        let f = C4Font(name: "ArialRoundedMTBold", size: 30.0)
        var l:C4TextShape!
        
        var colorString = "\(red.fillColor!.red),\(red.fillColor!.green),\(red.fillColor!.blue),\(red.fillColor!.alpha)"
        
        l = C4TextShape(text: colorString, font: f)
        l.fillColor = white
        l.center = red.center;
        self.canvas.add(l)
        
        colorString = "\(blue.fillColor!.red),\(blue.fillColor!.green),\(blue.fillColor!.blue),\(blue.fillColor!.alpha)"
        
        l = C4TextShape(text: colorString, font: f)
        l.fillColor = white
        l.center = blue.center;
        self.canvas.add(l)
        
        colorString = "\(grey.fillColor!.red),\(grey.fillColor!.green),\(grey.fillColor!.blue),\(red.fillColor!.alpha)"
        
        l = C4TextShape(text: colorString, font: f)
        l.fillColor = lightGray
        l.center = grey.center;
        self.canvas.add(l)
        
    }
}

