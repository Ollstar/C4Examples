//
//  Movies01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Movies01: CanvasController {
    
    var playIfTrue = true
    
    override func setup() {
        //create a movie and play it automatically
        let movie = Movie("step.mov")!
        movie.center = self.canvas.center
        
        canvas.addTapGestureRecognizer { (center, location, state) -> () in
            
            if self.playIfTrue {
                movie.play()
                self.playIfTrue = false
            } else {
                movie.stop()
                self.playIfTrue = true
            }
        }
        
        self.canvas.add(movie)
    }
    
}