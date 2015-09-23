//
//  Colors01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Colors01: C4CanvasController {
    
    var shapeFrame:C4Rect!
    var shapeOrigin:C4Point!
    var whiteSpace:Double!
    var labelFont:C4Font!
    var label:C4TextShape!
    
    override func setup() {
        
        //define the height of individual shapes
        let shapeHeight = self.canvas.height/11
        
        //calculate the white space between
        whiteSpace = self.canvas.height - 10 * shapeHeight
        whiteSpace = whiteSpace/11
        shapeFrame = C4Rect(0, 0, self.canvas.width - 2*whiteSpace, shapeHeight);
        
        //create a font to use for the labels
        labelFont = C4Font(name: "ArialRoundedMTBold", size: 20)
        
        //each type of color example is contained in its own method
        defaultColors()
        C4Colors()
        presetColors()
        rgbColors()
        hsbColors()
        whiteColors()
        systemColors()
        alphaColors()
        imagePatternColors()
        hexColors()
    }
    
    func defaultColors() {
        let rect = C4Rectangle(frame:shapeFrame)
        shapeOrigin = C4Point(whiteSpace, whiteSpace)
        rect.origin = shapeOrigin
        self.canvas.add(rect)
        
        label = C4TextShape(text:"Default Colors", font:labelFont)
        label.center = rect.center;
        self.canvas.add(label)
    }
    
    func C4Colors() {
        let rect = C4Rectangle(frame:shapeFrame)
        shapeOrigin.y += whiteSpace + rect.height
        rect.origin = shapeOrigin
        
        //There are 3 predefined colors in C4: C4Blue, C4Grey, C4Pink
        rect.fillColor = C4Blue
        rect.strokeColor = C4Grey
        
        self.canvas.add(rect)
        
        label = C4TextShape(text: "C4 Colors (from the logo)", font: labelFont)
        label.center = rect.center
        self.canvas.add(label)
    }
    
    func presetColors() {
        let rect = C4Rectangle(frame:shapeFrame)
        shapeOrigin.y += whiteSpace + rect.height
        rect.origin = shapeOrigin
        
        //There are a series of predefined colors, see UIColor documentation for more
        rect.fillColor = orange
        rect.strokeColor = darkGray
        
        self.canvas.add(rect)
        
        label = C4TextShape(text: "Predefined UIColors", font: labelFont)
        label.center = rect.center
        self.canvas.add(label)
        
    }
    
    func rgbColors() {
        let rect = C4Rectangle(frame:shapeFrame)
        shapeOrigin.y += whiteSpace + rect.height
        rect.origin = shapeOrigin
        
        //You can set the RGB values with each component ranging from 0 .. 1.0 like this:
        rect.fillColor = C4Color(UIColor(red: 0.50, green:1.0, blue:0.0, alpha:1.0))//lime (ish)
        rect.strokeColor = C4Color(UIColor(red: 0.50, green:0.0, blue:0.0, alpha:1.0))//half red
        
        
        self.canvas.add(rect)
        
        label = C4TextShape(text: "RGB Colors", font: labelFont)
        label.center = rect.center
        self.canvas.add(label)
        
    }
    
    func hsbColors() {
        let rect = C4Rectangle(frame:shapeFrame)
        shapeOrigin.y += whiteSpace + rect.height
        rect.origin = shapeOrigin
        
        //You can set the HSB values with each component ranging from 0 .. 1.0 like this:
        rect.fillColor = C4Color(UIColor(hue: 0.5, saturation: 1.0, brightness: 1.0, alpha: 1.0))
        rect.strokeColor = C4Color(UIColor(hue: 0.25, saturation: 0.75, brightness: 0.5, alpha: 1.0))
        
        
        self.canvas.add(rect)
        
        label = C4TextShape(text: "HSB Colors", font: labelFont)
        label.center = rect.center
        self.canvas.add(label)
        
    }
    
    func whiteColors() {
        let rect = C4Rectangle(frame:shapeFrame)
        shapeOrigin.y += whiteSpace + rect.height
        rect.origin = shapeOrigin
        
        //You can set grayscale colors by defining them in the range of white:
        rect.fillColor = C4Color(UIColor(white: 0.5, alpha: 1.0))
        rect.strokeColor = C4Color(UIColor(white: 0.33, alpha: 1.0))
        
        
        self.canvas.add(rect)
        
        label = C4TextShape(text: "White/Grayscale Colors", font: labelFont)
        label.center = rect.center
        self.canvas.add(label)
    }
    
    func systemColors() {
        let rect = C4Rectangle(frame:shapeFrame)
        shapeOrigin.y += whiteSpace + rect.height
        rect.origin = shapeOrigin
        
        //There are a series of system colors, see UIColor documentation for more:
        rect.fillColor = C4Color(UIColor.groupTableViewBackgroundColor())//looks like a hatched color on my device
        rect.strokeColor = C4Color(UIColor.darkTextColor())
        
        
        self.canvas.add(rect)
        
        label = C4TextShape(text: "System Colors", font: labelFont)
        label.center = rect.center
        self.canvas.add(label)
        
    }
    
    func alphaColors() {
        let rect = C4Rectangle(frame:shapeFrame)
        shapeOrigin.y += whiteSpace + rect.height
        rect.origin = shapeOrigin
        
        //You can create transparent colors from UIColor objects
        //This takes the default shape colors and makes them transparent
        rect.fillColor?.alpha = 0.5
        rect.strokeColor?.alpha = 0.5
        
        self.canvas.add(rect)
        
        label = C4TextShape(text: "Alpha Colors", font: labelFont)
        label.center = rect.center
        self.canvas.add(label)
        
    }
    
    func imagePatternColors() {
        let rect = C4Rectangle(frame:shapeFrame)
        shapeOrigin.y += whiteSpace + rect.height
        rect.origin = shapeOrigin
        
        //You can create colors using images as well...
        let fillPattern = C4Image("ollie_pic")
        rect.fillColor = C4Color(UIColor(patternImage: fillPattern.uiimage))
        //Here we use a transparent fill pattern for the outline
        let strokePattern = C4Image("ollie_pic")
        rect.strokeColor = C4Color(UIColor(patternImage: strokePattern.uiimage))
        
        self.canvas.add(rect)
        
        label = C4TextShape(text: "Pattern/Image Colors" , font: labelFont)
        label.center = rect.center
        self.canvas.add(label)
        
    }
    
    func hexColors() {
        let rect = C4Rectangle(frame:shapeFrame)
        shapeOrigin.y += whiteSpace + rect.height
        rect.origin = shapeOrigin
        
        //There are a series of predefined colors, see UIColor documentation for more
        rect.fillColor = C4Color(0xFF0000FF)
        rect.strokeColor = C4Color(0xFF0012FF)
        
        self.canvas.add(rect)
        
        label = C4TextShape(text: "Color from hexValue", font: labelFont)
        label.center = rect.center
        self.canvas.add(label)
    }
}

