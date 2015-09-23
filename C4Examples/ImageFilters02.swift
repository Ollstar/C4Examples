//
//  ImageFilters02.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters02: C4CanvasController {
    override func setup() {
        
        let image = C4Image("burnImage")
        let filter = C4Bloom()
//        filter.image = C4Image("rocket")
        image.apply(filter)
        image.center = canvas.center
        canvas.add(image)
        
    }
}