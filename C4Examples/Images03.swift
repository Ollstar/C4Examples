//
//  Images03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-04.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Images03 : C4CanvasController {
    
    override func setup() {
        
        let img = C4Image("ollie_pic")
        img.height = self.canvas.height
        img.center = self.canvas.center;
        self.canvas.add(img)
    }
}