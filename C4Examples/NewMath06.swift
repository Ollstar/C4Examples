//
//  NewMath06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-23.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit


class NewMath06: C4CanvasController {
    var shouldTrack = false
    let circle = C4Circle(center: C4Point(), radius: 15)
    var grayPath : C4Polygon!
    var bluePath : C4Polygon!
    var newPath : C4Polygon!
    var maskPath : C4Polygon!
    var distances = [Double]()
    var totalDistance = 0.0
    var dIndex = 0.0
    var start = C4Point()
    var end = C4Point()
    
    override func setup() {
        createGrayPath()
        createNewPath()
        createBluePath()
        
    }
    
    func createBluePath() {
        var points = [C4Point]()
        
        var x = 0.0
        C4ShapeLayer.disableActions = true
        circle.strokeColor = clear
        circle.shadow.opacity = 1.0
        circle.shadow.offset = C4Size(0,2)
        circle.shadow.radius = 1
        circle.shadow.opacity = 0.5
        circle.fillColor = white
        C4ShapeLayer.disableActions = false
        
        repeat {
            let calX = (x / canvas.width * 2.0 * M_PI)
            var y = sin(calX)                // create Y
            y *= 5                                        // zoom in (scale height to 5 points)
            y = ceil(y)                      // ceiling value
            
            y *= 20                   //scale height to 20 points
            y *= -1                    //invert for iOS screen coords
            
            if x == 0.0 {
                circle.center = C4Point(x,y)
                print(circle.center)
                distances.append(0.0)
                start = circle.center
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
        
        end = points.last!
        
        totalDistance = distances.last!
        dIndex = Double(distances.count) / 100.0
        bluePath = C4Polygon(points)
        bluePath.strokeColor = C4Blue
        bluePath.fillColor = clear
        bluePath.lineWidth = 35.0
        bluePath.center = canvas.center
        
        C4ShapeLayer.disableActions = true
        bluePath.strokeEnd = 0.0
        C4ShapeLayer.disableActions = false
        
        maskPath = C4Polygon(points)
        maskPath.strokeColor = C4Blue
        maskPath.fillColor = clear
        maskPath.lineWidth = 35.0
        maskPath.center = canvas.center
        maskPath.strokeEnd = 0.0
        
        let g = C4Gradient(frame: canvas.frame, colors: [C4Blue, C4Purple], locations: [0,1])
        g.layer?.mask = maskPath.layer
        g.startPoint = C4Point(start.x/canvas.width,start.y/canvas.height)
        g.endPoint = C4Point(end.x/canvas.width,end.y/canvas.height)
        g.interactionEnabled = false
        canvas.add(g)
        
        canvas.add(bluePath)
        bluePath.add(grayPath)
        bluePath.add(newPath)
        bluePath.add(circle)
        
        let kfa = CAKeyframeAnimation()
        kfa.path = bluePath.path!.CGPath
        kfa.duration = 1.0
        kfa.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)]
        
        circle.layer?.addAnimation(kfa, forKey: "position")
        circle.layer?.speed = 0.0
        
        circle.addPanGestureRecognizer { (location, translation, velocity, state) -> () in
            C4ShapeLayer.disableActions = true
            let converted = self.canvas.convert(location, from: self.circle)
            
            let index = Int(converted.x / self.canvas.width * 100.0 * self.dIndex)
            self.circle.layer?.timeOffset = CFTimeInterval(converted.x/self.canvas.width)
            self.maskPath.strokeEnd = self.distances[index]/self.totalDistance
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
            y *= 5                                        // zoom in (scale height to 5 points)
            y = ceil(y)                      // ceiling value
            
            y *= 20                   //scale height to 20 points
            y *= -1                    //invert for iOS screen coords
            if x == 0.0 {
                circle.center = C4Point(x,y)
            }
            
            let point = C4Point(x,y)
            
            points.append(point)
            x += 0.25
        } while x < canvas.width
        
        grayPath = C4Polygon(points)
        grayPath.strokeColor = C4Color(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.15)
        grayPath.fillColor = clear
        grayPath.lineWidth = 2.0
        grayPath.lineJoin = .Round
        
    }
    func createNewPath() {
        var points = [C4Point]()
        
        var x = 0.0
        
        repeat {
            let calX = (x / canvas.width * 2.0 * M_PI)
            var y = sin(calX)                // create Y
            y *= 5                                        // zoom in (scale height to 5 points)
            
            y *= 20                   //scale height to 20 points
            y *= -1                    //invert for iOS screen coords
            if x == 0.0 {
                circle.center = C4Point(x,y)
            }
            
            let point = C4Point(x,y)
            
            points.append(point)
            x += 0.25
        } while x < canvas.width
        
        newPath = C4Polygon(points)
        newPath.strokeColor = C4Color(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.10)
        newPath.fillColor = clear
        newPath.lineWidth = 3.0
        
    }
}