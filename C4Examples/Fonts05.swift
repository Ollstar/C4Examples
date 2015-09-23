//
//  Fonts05.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-11.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Fonts05: C4CanvasController {
    override func setup() {
        //This example is best for iPad / iPad simulator
        //get all the family names
        let familyNamesArray = C4Font.familyNames()
        
        var point = C4Point(10, 10)
        
        //cycle thought all the family names, creating labels for each one
        for familyName in familyNamesArray {
            let fontNames = C4Font.fontNames(familyName as! String)
            for fontName in fontNames {
                let f = C4Font(name: fontName as! String, size: 11.0)
                let l = C4TextShape(text: fontName as! String, font: f)
                l.origin = point
                point.y += l.height
                if (point.y > self.canvas.height) {
                    point.x += self.canvas.width / 3
                    point.y = 10
                }
                self.canvas.add(l)
            }
        }
    }
}