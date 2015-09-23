//
//  Fonts02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Fonts02: C4CanvasController {
    override func setup() {
        //create a regular system font
        var font = C4Font.systemFont(30.0)
        var label = C4TextShape(text: "Regular System Font", font: font)
        label.center = C4Point(self.canvas.center.x, self.canvas.height / 4.0)
        
        self.canvas.add(label)
        
        //create a bold system font
        font = C4Font.boldSystemFont(30.0)
        label = C4TextShape(text: "Bold System Font", font: font)
        label.center = C4Point(self.canvas.center.x, self.canvas.height * 2.0 / 4.0)
        
        self.canvas.add(label)
        
        //create a italic system font
        font = C4Font.italicSystemFont(30.0)
        label = C4TextShape(text: "Italic System Font", font: font)
        label.center = C4Point(self.canvas.center.x, self.canvas.height * 3.0 / 4.0)
        
        self.canvas.add(label)
    }
}