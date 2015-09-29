//
//  NewMath04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-22.
//  Copyright © 2015 Slant. All rights reserved.
//
import C4
import UIKit

class NewMath04: C4CanvasController {
    var mainPoints = [C4Point]()
    var modifiedPoints = [C4Point]()
    var insetFrame = C4Rect()
    override func setup() {
        let margin = canvas.frame.size.height * 0.1
        insetFrame = inset(canvas.frame, dx: margin, dy: margin)
        createPoints()
        
        let path = MathComparePaths(frame: canvas.frame, insetFrame: insetFrame, points: mainPoints, modifiedPoints: modifiedPoints)
        path.center = canvas.center
        canvas.add(path)
    }
    
    func createPoints() {
        var x = 0.0
        repeat {
            //normalize position of x to frame width
            let nX = x / insetFrame.size.width
            //define period for curve
            let period = 0.5
            //define scale (-1 inverts from CoreGraphics orientation)
            let scale = -1 * insetFrame.size.height / 2.0
            //define offset for y
            let offset = insetFrame.size.height / 2.0
            //calculate y
            let my = (atan(nX * period)) * scale + offset
            let y = atan(nX * period) * scale + offset
            
            
            let mp = C4Point(x+insetFrame.origin.x,my+insetFrame.origin.y)
            let p = C4Point(x+insetFrame.origin.x,y+insetFrame.origin.x)
            
            //append the point to the array
            modifiedPoints.append(mp)
            mainPoints.append(p)
            //increment x
            x += 1.0
        } while x < insetFrame.size.width
    }
}