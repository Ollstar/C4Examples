//
//  Interaction04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-16.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Interaction03: C4CanvasController {
    
    var s1:C4Circle!
    var s2:C4Circle!
    var s3:C4Circle!
    
    override func setup() {
        s1 = C4Circle(center: self.canvas.center, radius: 50)
        s2 = C4Circle(center: self.canvas.center, radius: 50)
        s3 = C4Circle(center: self.canvas.center, radius: 50)
        
        s1.addLongPressGestureRecognizer { (location, state) -> () in
            if state == .Began {
                self.randomColor(self.s1)
            } else if state == .Ended {
                self.s1.fillColor = C4Blue
            }
        }
        
        
        s2.addLongPressGestureRecognizer { (location, state) -> () in
            if state == .Began {
                self.randomColor(self.s2)
            } else if state == .Ended {
                self.s2.fillColor = C4Pink
            }
        }
        
        s3.addLongPressGestureRecognizer { (location, state) -> () in
            if state == .Began {
                self.randomColor(self.s3)
            } else if state == .Ended {
                self.s3.fillColor = C4Grey
            }
        }
        
        
        s1.center.y -= 150
        //leave s2 center as-is because it's already canvas.center
        s3.center.y += 150
        
        
        
        self.canvas.add(s1)
        self.canvas.add(s2)
        self.canvas.add(s3)
    }
    
    
    func randomColor(shape: C4Shape) {
        shape.fillColor = C4Color(red: random01(), green: random01(), blue: random01(), alpha: random01())
    }
}