//
//  Movies01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

protocol Player {
    var movie: Movie { get }
    
    var audioPlayer: AudioPlayer { get }
    
}

extension CanvasController: Player {
    public override func viewWillDisappear(animated: Bool) {
    }
}

class Movies01: CanvasController {
    
    var playIfTrue = true
    var movie: Movie!
    override func setup() {
        //create a movie and play it automatically
        movie = Movie("step.mov")
        movie.center = self.canvas.center
        
        canvas.addTapGestureRecognizer { (center, location, state) -> () in
            
            if self.playIfTrue {
                self.movie.play()
                self.playIfTrue = false
            } else {
                self.movie.stop()
                self.playIfTrue = true
            }
        }
        
        self.canvas.add(movie)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        movie.stop()
        
    }
    
}