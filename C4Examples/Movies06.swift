//
//  Movies06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Movies06: C4CanvasController {
    
    
    var movie:C4Movie!
    
    override func setup() {
        //create a movie and play it automatically
        let movie = C4Movie("test.mov")
//        movie.reachedEnd {
//            let s = C4Ellipse(frame: movie.frame)
//            movie.layer?.mask = s.layer
//            let a = C4ViewAnimation(duration: 2) {
//                s.transform.rotate(M_PI)
//            }
//            a.repeats = true
//            a.animate()
//        }
        movie.frame = C4Rect(0, 0, self.canvas.frame.max.x,self.canvas.frame.max.y)
        movie.loops = false
        movie.play()
        self.canvas.add(movie)
    }

}