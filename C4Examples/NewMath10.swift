//
//  NewMath10.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-23.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit


class NewMath10: C4CanvasController {
    var shouldTrack = false
    let circle = C4Circle(center: C4Point(), radius: 15)
    var grayPath : C4Polygon!
    var bluePath : C4Polygon!
    var distances = [Double]()
    var totalDistance = 0.0
    var dIndex = 0.0
    
    override func setup() {
        createGrayPath()
        createBluePath()
        
    }
    
    func createBluePath() {
        var points = [C4Point]()
        
        var x = 0.0
        circle.strokeColor = clear
        circle.shadow.opacity = 1.0
        circle.shadow.offset = C4Size(0,2)
        circle.shadow.radius = 1
        circle.shadow.opacity = 0.5
        circle.fillColor = white
        repeat {
            let calX = (x / canvas.width * 2.0 * M_PI)
            var y = sin(calX)                // create Y
            
            // fromMin: is the previous minumum value
            // max: is the previous maximum value
            // toMin: is the new minumum (inverted, scaled and displaced to the center of the canvas)
            // max: is the new maximum (inverted, scaled and displaced to the center of the canvas)
            y = map(y, min: -1, max: 1, toMin: self.canvas.center.y + 100, toMax: self.canvas.center.y - 100)                     // map value
            // by using map we can elliminate the need for the following lines of code:
            //    y *= 100;                   //scale height to 100 points
            //    y *= -1;                    //invert for iOS screen coords
            //    y += self.canvas.height/2;  //move to halfway down the screen
            if x == 0.0 {
                circle.center = C4Point(x,y)
                distances.append(0.0)
            }
            
            let point = C4Point(x,y)
            if points.count > 0 {
                let a = points.last!
                let b = point
                var d = distance(a, rhs: b)
                d += distances.last!
                distances.append(d)
            }
            points.append(point)
            x += 0.25
        } while x < canvas.width
        
        totalDistance = distances.last!
        dIndex = Double(distances.count)
        bluePath = C4Polygon(points)
        bluePath.strokeColor = C4Blue
        bluePath.fillColor = clear
        bluePath.lineWidth = 35.0
        bluePath.center = canvas.center
        
        bluePath.strokeEnd = 0.0
        grayPath.center.y += bluePath.height // this moves the graypath closer to canvas center !need to fix this!
        canvas.add(bluePath)
        bluePath.add(grayPath)
        bluePath.add(circle)
        circle.layer?.zPosition = 1.0
        
        let kfa = CAKeyframeAnimation()
        kfa.path = bluePath.path!.CGPath
        kfa.duration = 1.0
        kfa.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)]
        
        circle.layer?.addAnimation(kfa, forKey: "position")
        circle.layer?.speed = 0.0
        
        circle.addPanGestureRecognizer { (location, translation, velocity, state) -> () in
            let converted = self.canvas.convert(location, from: self.circle)
            
            let index = Int(converted.x / self.canvas.width * self.dIndex)
            self.circle.layer?.timeOffset = CFTimeInterval(converted.x/self.canvas.width)
            self.bluePath.strokeEnd = self.distances[index]/self.totalDistance
            
            if state == .Ended {
                if let pl = self.circle.layer?.presentationLayer() as? CALayer {
                    self.circle.center = C4Point(pl.position)
                }
            }
        }
    }
    
    func createGrayPath() {
        var points = [C4Point]()
        
        var x = 0.0
        
        repeat {
            let calX = (x / canvas.width * 2.0 * M_PI)
            var y = sin(calX)                // create Y
            
            
            y *= 100                   //scale height to 20 points
            y *= -1                    //invert for iOS screen coords
            if x == 0.0 {
                circle.center = C4Point(x,y)
            }
            
            let point = C4Point(x,y)
            
            points.append(point)
            x += 0.25
        } while x < canvas.width
        
        grayPath = C4Polygon(points)
        grayPath.strokeColor = C4Color(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.07)
        grayPath.fillColor = clear
        grayPath.lineWidth = 3.0
        
    }
}