//
//  AudioPlayer08.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class AudioPlayer08: CanvasController {
    
    var audioPlayer:AudioPlayer!
    var label:TextShape!
    var velocityMax:Double = 10000
    
    override func setup() {
        
        audioPlayer = AudioPlayer("soundTest.mp3")
        audioPlayer.loops = true
        self.setupLabels()
        
//        self.setupLabels()
        self.canvas.addPanGestureRecognizer { (center, location, translation, velocity, state) -> () in
            //slide finger quickly over screen to change pan from left to right.
            self.audioPlayer.pan = abs(velocity.x) / self.velocityMax
            print("\(abs(velocity.x))")
            
            
        }
        
        self.canvas.addTapGestureRecognizer { (center, location, state) -> () in
            
            //playing returns true if the receiver's current playback rate > 0. Otherwise returns false.
            if self.audioPlayer.playing == false{
                self.audioPlayer.play()
                print("playing")
                self.updateLabel()
                
                self.canvas.backgroundColor = C4Blue
            } else {
                self.audioPlayer.stop()
                self.canvas.backgroundColor = C4Pink
                print("stopped")
            }
            
        }
    }
    
    func setupLabels() {
        label = TextShape(text: "Current time is :\(audioPlayer.currentTime)", font: Font.systemFont(30.0))
        self.canvas.add(label)
        label.center = self.canvas.center;
        self.canvas.add(label)
        self.updateLabel()
    }
    
    func updateLabel() {
        label.removeFromSuperview()
        label = TextShape(text: "Current time is :\(audioPlayer.currentTime)", font: Font.systemFont(30.0))
        self.canvas.add(label)
        wait(0.01) {
            self.updateLabel()
        }
        
    }
}
