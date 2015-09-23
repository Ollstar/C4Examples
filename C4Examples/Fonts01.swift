//
//  Fonts01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Fonts01: C4CanvasController {
    override func setup() {
        //create an initial font and a label
        let font = C4Font(name: "helvetica", size: 40.0)
        let label = C4TextShape(text: "initial font", font: font)
        label.center = C4Point(self.canvas.center.x, self.canvas.height / 3.0)
        
        //use the initial font to create a new font with a bigger size
        let fontLarge = font.font(80.0)
        let labelLarge = C4TextShape(text: "Large font", font: fontLarge)
        labelLarge.center = C4Point(self.canvas.center.x, self.canvas.height * 2.0 / 3.0);
        
        //add the labels to the canvas
        self.canvas.add(label)
        self.canvas.add(labelLarge)

    }
}
