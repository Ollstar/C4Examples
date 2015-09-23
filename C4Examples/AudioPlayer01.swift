//
//  AudioPlayer01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class AudioPlayer01: C4CanvasController {
    
    var audioPlayer:C4AudioPlayer!
    
    override func setup() {
        
        audioPlayer = C4AudioPlayer("sound.wav")
        
        self.canvas.addTapGestureRecognizer { (location, state) -> () in
            self.audioPlayer.play()
//            print("in tap")
        }
    }
}
