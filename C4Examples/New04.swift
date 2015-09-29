//
//  New04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-23.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class New04: C4CanvasController {
    
    let s1 = C4Circle(center: C4Point(), radius: 50)
    let s2 = C4Circle(center: C4Point(), radius: 50)
    let maxCount = 4
    var count = 0
    
    override func setup() {
        
        s1.fillColor = C4Pink
        s1.center = self.canvas.center
        s1.center.y -= 75
        s2.center = self.canvas.center
        s2.center.y += 75
        
        s1.addTapGestureRecognizer { (location, state) -> () in
            self.s1.fillColor = C4Pink
            self.s1.post("tapped")
        }
        s2.addTapGestureRecognizer { (location, state) -> () in
            self.s2.fillColor = C4Blue
            self.s2.post("tapped")
        }
        canvas.addTapGestureRecognizer { (location, state) -> () in
            self.canvas.backgroundColor = C4Grey
            self.canvas.layer?.post("tapped")
        }
        self.s1.on(event: "tapped", from: self.canvas.layer) { (Void) -> Void in
            self.s1.fillColor = self.canvas.backgroundColor
        }
        self.s2.layer?.on(event: "tapped", from: self.canvas.layer) { (Void) -> Void in
            self.s2.fillColor = self.canvas.backgroundColor
            self.count++

        }
        canvas.on(event: "tapped", from: s1) { (Void) -> Void in
            self.canvas.backgroundColor = self.s1.fillColor
            self.count++
        }
        canvas.on(event: "tapped", from: s2) { (Void) -> Void in
            self.canvas.backgroundColor = self.s2.fillColor
            self.count++
            if self.count == self.maxCount {
                self.s2.layer?.cancel(self.canvas.layer!)
            }

        }
        canvas.add(s1)
        canvas.add(s2)
        
    
        
        
    }
}
