//
//  ImageFilters01.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters01: C4CanvasController {
    override func setup() {
        
            let image = C4Image("ollie_pic")
            var filter = C4ColorBurn()
            filter.background = C4Image("rocket")
            image.apply(filter)
            image.center = canvas.center
            canvas.add(image)
       
    }
}
