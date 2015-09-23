//
//  Advanced03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-14.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Advanced03: C4CanvasController {
    
    var shapes = [C4Shape]()
    
    override func setup() {
        
        for i in 0..<100 {
            let s = C4Rectangle(frame: C4Rect(0,0,self.canvas.height,20))
            s.fillColor = C4Color(UIColor(white: 0.0, alpha:CGFloat(Double(i)/40.0)))
            s.strokeColor = C4Color(UIColor.clearColor())
            s.anchorPoint = C4Point(0.5,8.0+Double(i))
            var p = self.canvas.center
            p.y += self.canvas.height/2
            s.center = p
            shapes.append(s)
            canvas.add(s)
        }
        delay(0.1) {
            self.setupAnimations()
        }
    }
    
    func setupAnimations() {
        for i in 0..<shapes.count {
            
            let s = shapes[i]
            let a = C4ViewAnimation(duration: Double(i)*0.01 + 1) {
                s.transform.rotate(M_PI_2)
            }
            a.repeats = true
            a.animate()
            
        }
    }
}

