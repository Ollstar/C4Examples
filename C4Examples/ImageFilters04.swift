//
//  ImageFilters04.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters04: C4CanvasController {
    override func setup() {
        
        let image = C4Image("burnImage")
        var filter = C4DotScreen()
        filter.center = canvas.center
        filter.width = 5
        filter.sharpness = 100

        image.apply(filter)
        image.center = canvas.center
        canvas.add(image)
        
    }
}