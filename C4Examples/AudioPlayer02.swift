//
//  AudioPlayer02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class AudioPlayer02: C4CanvasController {
    
    var audioPlayer:C4AudioPlayer!
    
    override func setup() {
        
        audioPlayer = C4AudioPlayer("soundTest.mp3")
        
        self.canvas.addTapGestureRecognizer { (location, state) -> () in
            
            //playing returns true if the receiver's current playback rate > 0. Otherwise returns false.
            if self.audioPlayer.playing == false{
                self.audioPlayer.play()
                print("playing")
                self.canvas.backgroundColor = C4Pink
            } else {
                self.audioPlayer.stop()
                self.canvas.backgroundColor = C4Blue
                print("stopped")
            }
            
        }
    }
}