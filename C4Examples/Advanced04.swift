//
//  Advanced04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-14.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Advanced04: C4CanvasController {
    
    
    var circle:C4Circle!
    var pink:Double!
    var blue:Double!
    var grey:Double!
    var pc = 0
    var bc = 0
    var gc = 0
    var pl = C4TextShape()
    var bl = C4TextShape()
    var gl = C4TextShape()
    
    override func setup() {
        // percent chance of each color being chosen (total must equal 100)
        pink = 0.3
        blue = 0.55
        grey = 0.15
        
        setupCircle()
        updateLabels()
        delay(1.0) {
            self.changeColors()
        }
        self.canvas.add(circle)
    }
    
    func changeColors() {
        weightedProbability()
        updateLabels()
        circle.strokeEnd = 0.0
        let a = C4ViewAnimation(duration:1.3) {
        self.circle.strokeEnd = 1.0
        }
        a.animate()
        delay(1.5) {
            self.changeColors()
        }
    }
    
    func weightedProbability() {
        let chance = Double(random01())
        if (chance <= pink) {
            circle.fillColor = C4Pink
            pc++
        }
        if (chance > pink && chance <= pink + blue){
            circle.fillColor = C4Blue
            bc++
        }
        if (chance > pink + blue && chance <= pink + blue + grey){
            circle.fillColor = C4Grey
            gc++
        }
    }
    
    func setupCircle() {
        circle = C4Circle(center: self.canvas.center, radius: 100)
        let a = C4ViewAnimation(duration: 1.0) {
        self.circle.strokeColor = C4Color(UIColor.blackColor())
        self.circle.transform.rotate(-M_PI/2)
        self.circle.lineWidth = 10.0
        self.circle.fillColor = C4Color(UIColor.clearColor())
        }
        a.animate()
    }
    
    func updateLabels() {
        //we need to remove the old labels and replace with labels reflecting the latest counts
        canvas.remove(pl)
        canvas.remove(bl)
        canvas.remove(gl)
        let ps = "Red has been chosen \(pc) times"
        let bs = "Blue has been chosen \(bc) times"
        let gs = "Grey has been chosen \(gc) times"
        
        pl = C4TextShape(text: ps, font: C4Font(name: "Helvetica", size: 14.0))
        bl = C4TextShape(text: bs, font: C4Font(name: "Helvetica", size: 14.0))
        gl = C4TextShape(text: gs, font: C4Font(name: "Helvetica", size: 14.0))
        
        self.canvas.add(pl)
        self.canvas.add(bl)
        self.canvas.add(gl)
        
        var labelCenter = self.canvas.center
        labelCenter.y += 150
        pl.center = labelCenter
        labelCenter.y += 30
        bl.center = labelCenter
        labelCenter.y += 30
        gl.center = labelCenter
        
    }

}

