//
//  ImageFilters07.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class ImageFilters07: CanvasController {
    override func setup() {
        
        let image = Image()
        image.frame = Rect(canvas.center.x, canvas.center.y, 100, 100)
        
        var filter = LinearGradient()
        filter.colors = [Color(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5), Color(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.1)]
        filter.points = [Point(),Point(10,50)]
        
        image.generate(filter)
        
        image.center = canvas.center
        canvas.add(image)
        
    }
}