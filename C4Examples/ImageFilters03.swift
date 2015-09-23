//
//  ImageFilters03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters03: C4CanvasController {
    override func setup() {
        
        let image = C4Image()
        image.frame = C4Rect(canvas.center.x, canvas.center.y, 100, 100)
        
        var filter = C4Checkerboard()
        filter.center = canvas.center
        filter.colors = [C4Color(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5), C4Color(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.1)]
        filter.sharpness = 1.0
        filter.width = 5.0
        
        image.generate(filter)
        
        image.center = canvas.center
        canvas.add(image)
        
    }
}