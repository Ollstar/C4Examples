//
//  NewMath11.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-23.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class NewMath11: C4CanvasController {
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
            let y = sin(x * 2 * M_PI) * -1//-1 inverts from iOS coordinates to normal cartesian
            let my = max(sin(x * 2 * M_PI), 0.25) * -1// -1 inverts from iOS coordinates to normal cartesian max value
            modifiedPoints.append(C4Point(x,my))
            mainPoints.append(C4Point(x,y))
            x += 0.001
        } while x < 1
    }
}