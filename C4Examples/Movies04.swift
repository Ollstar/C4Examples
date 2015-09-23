//
//  Movies04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Movies04: C4CanvasController {
    
    var playIfTrue = true
    
    override func setup() {
        //create a movie and play it automatically
        let movie = C4Movie("step.mov")
        movie.center = self.canvas.center
        movie.play()
        let a = C4ViewAnimation(duration: 1.5) {
            movie.frame = C4Rect(movie.center.x, movie.center.y, 200,200)
        }
        a.repeats = false
        a.autoreverses = true
        canvas.addTapGestureRecognizer { (location, state) -> () in
            a.animate()
        }
        
        self.canvas.add(movie)
    }
    
}