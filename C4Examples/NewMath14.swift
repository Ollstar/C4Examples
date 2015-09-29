//
//  NewMath14.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-23.
//  Copyright © 2015 Slant. All rights reserved.
//
import C4
import UIKit

class NewMath14: C4CanvasController {
    var mainPoints = [C4Point]()
    var modifiedPoints = [C4Point]()
    var insetFrame = C4Rect()
    override func setup() {
        let margin = canvas.frame.size.height * 0.1
        insetFrame = inset(canvas.frame, dx: margin, dy: margin)
        createPoints()
        let path = MathComparePaths(frame: canvas.frame, insetFrame: insetFrame, points: mainPoints, modifiedPoints: modifiedPoints)
        canvas.add(path)
    }
    
    func createPoints() {
        var x = 0.0
        repeat {
            let y = (clamp(tan(x * 2 * M_PI), min: -self.insetFrame.size.height, max: self.insetFrame.size.height))//-1 inverts from iOS coordinates to normal cartesian
            let my = y
            modifiedPoints.append(C4Point(x,my))
            mainPoints.append(C4Point(x,y))
            x += 0.001
        } while x < 1
    }
}