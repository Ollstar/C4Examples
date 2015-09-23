//
//  Shapes18.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class Shapes18: C4CanvasController {
    
    var theShape:C4Shape!

    
    var circle : C4Circle!
    var square : C4Rectangle!
    var shape : C4Shape!
    var isCircle = true
    override func setup() {
        circle = C4Circle(center: canvas.center, radius: 100)
        square = C4Rectangle(frame: circle.frame)
        shape = C4Shape(frame: circle.frame)
        shape.path = circle.path
        canvas.add(shape)
        canvas.addTapGestureRecognizer { (location, state) -> () in
            if self.isCircle {
                self.shape.path = self.square.path
                self.isCircle = false
            } else {
                self.shape.path = self.circle.path
                self.isCircle = true
            }
        }
    }
}
//
//    override func setup() {
//            //setup up the initial shape
//            theShape = C4Rectangle(frame: C4Rect(0,0,240,240))
//            theShape.center = self.canvas.center;
//        
//            //set its animation duration which will be used for all animations
////            theShape.animationDuration = 1.0f;
//        
//            //add it to the canvas
//        self.canvas.add(theShape)
//        
//            //run the -(void)ellipse method 2 seconds later...
//                delay(2.0){
//                self.rect()
//                }
//        }
//        
//        func rect() {
//            theShape = C4Rectangle(frame: C4Rect(0,0,240,240))
//            theShape.center = self.canvas.center;
//            delay(2.0){
//                self.ellipse()
//            }
//    }
//        
//        func ellipse() {
//            theShape = C4Ellipse(frame: theShape.frame)
//            delay(2.0){
//                self.triangle()
//            }
//    }
//        
//        func triangle() {
//            let pts = [
//                C4Point(self.canvas.center.x-100, self.canvas.center.y),
//                C4Point(self.canvas.center.x, self.canvas.center.y-100),
//                C4Point(self.canvas.center.x+100, self.canvas.center.y)
//            ]
//            theShape = C4Triangle(pts)
//            delay(2.0){
//                self.arc()
//            }
//    }
//        
//        func arc() {
//
//            theShape = C4Arc(center: self.canvas.center, radius: 100, start: M_PI / 3.0, end: M_PI*2/3.0, clockwise: true)
//    
//            delay(2.0){
//                self.wedge()
//            }
//    }
//        
//        func wedge() {
//            theShape = C4Wedge(center: self.canvas.center, radius: 100, start: M_PI/3.0, end: M_PI*2/3.0, clockwise: false)
//        
//            delay(2.0){
//                self.bezierCurve()
//            }
//    }
//        
//        func bezierCurve() {
//            let endPoints = [
//                C4Point(self.canvas.center.x-100, self.canvas.center.y),
//                C4Point(self.canvas.center.x+100, self.canvas.center.y)
//            ]
//            let ctrlPoints = [
//                C4Point(random(below: Int(self.canvas.width)), random(below: Int(self.canvas.height))),
//                C4Point(random(below: Int(self.canvas.width)), random(below: Int(self.canvas.height)))
//            ]
//            theShape = C4Curve(points: endPoints, controls: ctrlPoints)
//            delay(2.0){
//                self.quadCurve()
//            }
//    }
//        
//        func quadCurve() {
//            let endPoints = [
//                C4Point(self.canvas.center.x-100, self.canvas.center.y),
//                C4Point(self.canvas.center.x+100, self.canvas.center.y)
//            ]
//            let ctrlPoint = C4Point(random(below: Int(self.canvas.width)), random(below: Int(self.canvas.height)))
//
//            theShape = C4QuadCurve(points: endPoints, control: ctrlPoint)
//            
//            delay(2.0){
//                self.polygon()
//            }
//    }
//        
//        func polygon() {
//            var pts = [C4Point]()
//            for _ in 0..<10 {
//                pts.append(C4Point(Double(random(below: 100))+self.canvas.center.x-100,
//                    Double(random(below: 100))+self.canvas.center.y-100))
//            }
//            theShape = C4Polygon(pts)
//            delay(2.0){
//                self.text()
//            }
//    }
//        
//        func text(){
//            let f = C4Font(name: "ArialRoundedMTBold", size: 180)
//            theShape = C4TextShape(text: "WHAM!", font: f)
//            theShape.center = self.canvas.center
//            delay(2.0){
//                self.rect()
//            }
//    }
//    
//}