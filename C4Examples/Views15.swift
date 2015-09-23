//
//  Views15.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views15: C4CanvasController {
    
    var circles = [C4Circle]()
    
    override func setup() {
        for i in 0...2 {
            let c = C4Circle(center: C4Point(100+44*Double(i),100), radius: 44)
            c.fillColor = C4Color(red: 0.33*Double(i+1), green: 1.0, blue: 1.0, alpha: 1.0)
            canvas.add(c)
            circles.append(c)
            c.addTapGestureRecognizer({ (location, state) -> () in
                self.updateZPosition(c)
            })
        }
    }
    
    func updateZPosition(obj: C4Circle) {
        print(obj)
        for circle in circles {
            if circle != obj {
                circle.layer?.zPosition -= 1
            } else {
                circle.layer?.zPosition = 3
            }
        }
        
        //        let s1 = C4Rectangle(frame: C4Rect(0,0,100,100))
        //        let s2 = C4Rectangle(frame: C4Rect(50,75,100,100))
        //        let s3 = C4Rectangle(frame: C4Rect(75,50,100,100))
        //
        //        canvas.add(s1)
        //        canvas.add(s2)
        //        canvas.add(s3)
        //
        //
        //        canvas.addTapGestureRecognizer { (location, state) -> () in
        //
        //            if s1.hitTest(location) {
        //                s1.layer?.zPosition = 1
        //            } else if s2.hitTest(location) {
        //                s2.layer?.zPosition = 1
        //
        //            } else if s3.hitTest(location) {
        //                s3.layer?.zPosition = 1
        //
        //            } else {
        //                s1.layer?.zPosition = 1
        //
        //            }
        //        }
        
    }
}
