//
//  Advanced06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-15.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Advanced06: C4CanvasController {
    
    var img:C4Image!
    var container = C4Rectangle()
    
    override func setup() {
        setupShapes()
        img.backgroundColor = C4Blue
        img.layer?.mask = container.layer
        canvas.add(img)
    }
    
    func setupShapes() {
        img = C4Image("ollie_pic")
        img.height = self.canvas.height
        container = C4Rectangle(frame: C4Rect(0,0,300, self.canvas.height))
        container.fillColor = C4Color(UIColor.clearColor())
        self.addVisibleContainer()
        
        img.center = self.canvas.center;
        container.center = C4Point(img.width/2 ,img.height/2);
        for _ in 0..<30 {
            self.makeStrip()
            
        }
    }
    
    func makeStrip() {
        let h = Double(random(min: Int(container.corner.height*2), max: 300)) // the strips need minimum container cornerRadius*2 or possible assertion failure
        let strip = C4Rectangle(frame: C4Rect(0,0,300,h))
        strip.center = C4Point(container.width/2 ,container.height/2);
        strip.opacity = 0.3
        strip.corner = C4Size(2,2)
        container.add(strip)
        newPlace(strip)
    }
    func newPlace(sender: C4Shape) {
        let time = random01()*5 + 1.5
        let a = C4ViewAnimation(duration:time) {
            sender.center = C4Point(sender.center.x, random01()*self.container.height)
        }
        a.animate()
        delay(time) {
            self.newPlace(sender)
        }
        
    }
    
    func addVisibleContainer() {
        let visibleContainer = C4Rectangle(frame: self.container.frame)
        visibleContainer.center = self.canvas.center
        visibleContainer.fillColor = C4Color(UIColor.clearColor())
        visibleContainer.lineWidth = 2.0
        visibleContainer.strokeColor = C4Blue
        self.canvas.add(visibleContainer)
    }
    
    
}
