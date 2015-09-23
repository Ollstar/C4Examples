//
//  AudioPlayer09.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class AudioPlayer09: C4CanvasController {
    var s:C4AudioPlayer!
    var meterUpdateTimer:NSTimer!
    var peakLeft:C4Line!
    var peakRight:C4Line!
    var avgLeft:C4Line!
    var avgRight:C4Line!
    
    
    override func setup() {
        s = C4AudioPlayer("soundTest.mp3")
        s.play()
        s.loops = true
        s.meteringEnabled = true
        
        
//        self.canvas.addTapGestureRecognizer { (location, state) -> () in
//            
//            //playing returns true if the receiver's current playback rate > 0. Otherwise returns false.
//            if self.s.playing == false{
//                self.s.play()
//                print("playing")
//            } else {
//                self.s.stop()
//                print("stopped")
//            }
//            
//        }
        
        var pts = [
            C4Point(self.canvas.width / 2, self.canvas.center.y + 100),
            C4Point(self.canvas.width / 2, self.canvas.center.y - 100)
        ]
        pts[0].x -= 100
        pts[1].x -= 100
        avgLeft = C4Line(pts)
        pts[0].x += 75
        pts[1].x += 75
        avgRight = C4Line(pts)
        pts[0].x += 75
        pts[1].x += 75
        peakLeft = C4Line(pts)
        pts[0].x += 75
        pts[1].x += 75
        peakRight = C4Line(pts)
        avgLeft.strokeColor = C4Pink
        avgRight.strokeColor = C4Pink
        canvas.add(avgLeft)
        canvas.add(avgRight)
        canvas.add(peakLeft)
        canvas.add(peakRight)
        meterUpdateTimer = NSTimer.scheduledTimerWithTimeInterval(1/30.0, target: self, selector: "updateMeters", userInfo: nil, repeats: true)
        meterUpdateTimer.fire()
        
    }
    
    func updateMeters() {
        s.updateMeters()
        
        var sav =  s.averagePower(0)
        var l = pow(10, 0.05 * sav)
        avgLeft.strokeEnd = l
        
        sav =  s.averagePower(1)
        l = pow(10, 0.05 * sav)
        avgRight.strokeEnd = l
        
        var sp =  s.peakPower(0)
        l = pow(10, 0.05 * sp)
        peakLeft.strokeEnd = l
        
        sp = s.peakPower(1)
        l = pow(10, 0.05 * sp)
        peakRight.strokeEnd = l
        
    }
}
