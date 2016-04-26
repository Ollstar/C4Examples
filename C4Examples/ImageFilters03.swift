//
//  ImageFilters03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters03: CanvasController {
    override func setup() {
        
        let image = Image()
        image.frame = Rect(canvas.center.x, canvas.center.y, 100, 100)
        
        var filter = Checkerboard()
        filter.center = canvas.center
        filter.colors = [Color(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5), Color(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.1)]
        filter.sharpness = 1.0
        filter.width = 5.0
        
        image.generate(filter)
        
        image.center = canvas.center
        canvas.add(image)
        
    }
}