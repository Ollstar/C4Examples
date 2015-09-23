//
//  Advanced02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-14.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Advanced02: C4CanvasController {
    
    var line:C4Line!
    
    override func setup() {
        let linePoints = [C4Point(), C4Point()]
        line = C4Line(linePoints)
        canvas.addPanGestureRecognizer({ (location, translation, velocity, state) -> () in
            
            
            self.line.a = self.canvas.center
            self.line.b = location
            self.line.strokeColor = C4Blue
            self.canvas.add(self.line)
            
            if (state == .Ended){
                self.canvas.remove(self.line)
            }
        })
    }
}
