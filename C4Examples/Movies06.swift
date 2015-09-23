//
//  Movies06.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-08.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class C4Movie1: C4Movie {
    

    override func reachedEnd() {
        super.reachedEnd()
        let s = C4Ellipse(frame: self.frame)
        self.layer?.mask = s.layer
        let a = C4ViewAnimation(duration: 2) {
            s.transform.rotate(M_PI)
        }
        a.repeats = true
        a.animate()
    }
}


class Movies06: C4CanvasController {
    
    
    var movie:C4Movie1!
    
    override func setup() {
        //create a movie and play it automatically
        let movie = C4Movie1("test.mov")
        movie.frame = C4Rect(0, 0, self.canvas.frame.max.x,self.canvas.frame.max.y)
        movie.loops = false
        movie.play()
        self.canvas.add(movie)
    }

}