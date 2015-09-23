//
//  Views09.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Views09: C4CanvasController {
    
    var circle:C4Circle!
    
    
    override func setup() {
        
        circle = C4Circle(center: self.canvas.center, radius: 44)
        circle.lineWidth = 40
        self.canvas.add(circle)
        
        canvas.addTapGestureRecognizer { (location, state) -> () in
            self.circle.view.clipsToBounds = !self.circle.view.clipsToBounds
        }
    }
}

