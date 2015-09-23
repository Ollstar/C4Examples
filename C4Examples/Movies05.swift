//
//  Movies05.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Movies05: C4CanvasController {
    
    var playIfTrue = true
    
    override func setup() {
        //create a movie and play it automatically
        let movie = C4Movie("step.mov")
        movie.center = self.canvas.center
        movie.play()
        movie.loops = true
        
        self.canvas.add(movie)
    }
    
}