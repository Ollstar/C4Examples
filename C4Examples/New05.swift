//
//  New05.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-23.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class New05: C4CanvasController {
    
    var circle = C4Circle()
    var grayCircle : C4Circle!
    var maskPath:C4Circle!
    var whitePath : C4Circle!
    var button : C4Circle = C4Circle(center: C4Point(), radius: 15)
    var radiansLabel = C4TextShape()
    var degreesLabel = C4TextShape()
    
    
    override func setup() {
        

        
        circle = C4Circle(center: canvas.center, radius: 100)
        whitePath = C4Circle(center: C4Point(circle.width/2, circle.width/2), radius: 100)
        
        maskPath = C4Circle(center: canvas.center, radius: 100)
        
        grayCircle = C4Circle(center: C4Point(circle.width/2, circle.width/2), radius: 100)
        
        
        maskPath.fillColor = clear
        maskPath.lineWidth = 35.0
        maskPath.strokeEnd = 0.0
        
        whitePath.fillColor = clear
        whitePath.lineWidth = 2
        whitePath.strokeColor = C4Color(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.15)
        
        
        circle.fillColor = clear
        circle.lineWidth = 35
        circle.strokeEnd = 0.0
        
        
        grayCircle.fillColor = clear
        grayCircle.lineWidth = 3
        grayCircle.strokeColor = C4Color(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.10)
        
        button.strokeColor = clear
        button.shadow.opacity = 1.0
        button.shadow.offset = C4Size(0,2)
        button.shadow.radius = 1
        button.shadow.opacity = 0.5
        button.fillColor = white
        
        
        let g = C4Gradient(frame: canvas.frame, colors: [C4Blue, C4Purple], locations: [0,1])
        g.layer?.mask = maskPath.layer
        
        
        g.startPoint = C4Point((canvas.center.x + maskPath.width/2)/maskPath.width, canvas.center.y/maskPath.height)
        g.endPoint = C4Point((canvas.center.x - maskPath.width/2)/maskPath.width, canvas.center.y/maskPath.height)
        g.interactionEnabled = false
        canvas.add(g)
        
        canvas.add(circle)
        circle.add(grayCircle)
        circle.add(whitePath)
        
        circle.add(button)
        
        
        
        let kfa = CAKeyframeAnimation()
        kfa.path = circle.path!.CGPath
        kfa.duration = 1.0
        kfa.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)]
        button.layer?.addAnimation(kfa, forKey: "position")
        button.layer?.speed = 0.0
        
        circle.addPanGestureRecognizer { (location, translation, velocity, state) -> () in
            C4ShapeLayer.disableActions = true
            let convert = self.canvas.convert(location, from: self.button)
            let a = C4Vector(x: convert.x, y: convert.y)
            let b = C4Vector(x: self.canvas.center.x+1, y: self.canvas.center.y)
            let c = C4Vector(x: self.canvas.center.x, y: self.canvas.center.y)
            let angle = a.angleTo(b, basedOn: c)
            var reflex = convert.y < self.canvas.center.y ? 2 * M_PI - angle : angle
            self.updateLabelsWithAngle(reflex)
            reflex = reflex / (M_PI * 2)
            self.button.layer?.timeOffset = CFTimeInterval(reflex * 0.8)
            self.maskPath.strokeEnd = reflex
            if state == .Ended {
                if let pl = self.circle.layer?.presentationLayer() as? CALayer {
                    self.circle.center = C4Point(pl.position)
                }
            }
            
            
        }
    }
    func updateLabelsWithAngle(angle:Double) {
        radiansLabel.removeFromSuperview()
        degreesLabel.removeFromSuperview()
        var text = String(format: "%.3f", angle)
        radiansLabel = C4TextShape(text: "Radians :\(text)", font: C4Font.systemFont(15))
        text = String(format: "%.3f", radToDeg(angle))
        degreesLabel = C4TextShape(text: "Degrees :\(text)", font: C4Font.systemFont(15))
        var center = canvas.center
        center.y -= 15
        
        degreesLabel.center = center
        
        center.y += 30
        radiansLabel.center = center
        self.canvas.add(radiansLabel)
        self.canvas.add(degreesLabel)
    }
}
