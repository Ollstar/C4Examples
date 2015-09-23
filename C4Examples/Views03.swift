//
//  Views03.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4

class Views03: C4CanvasController {
    override func setup() {
        let img = C4Image("ollie_pic")
        img.center = self.canvas.center
        img.border.width = 10.0
        img.border.color = C4Pink
        self.canvas.add(img)
    }
}
