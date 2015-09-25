//
//  Views23.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Views23: C4CanvasController {
    
    var s1:C4Circle!
    var s2:C4Circle!
    var s3:C4Circle!
    
    
    
    override func setup() {
        
        setupShapes()
        
        s1.shadow.color = C4Pink
        s2.shadow.color = C4Blue
        s3.shadow.color = C4Color(UIColor.darkGrayColor())
    }
    
    func setupShapes() {
        
        var currentCenter = self.canvas.center
        
        s1 = C4Circle(center: currentCenter, radius: 44)
        s2 = C4Circle(center: currentCenter, radius: 44)
        s3 = C4Circle(center: currentCenter, radius: 44)
        
        currentCenter.x -= 100
        s1.center = currentCenter
        self.canvas.add(s1)
        s1.shadow.offset = C4Size(30, 50)
        
        currentCenter.x += 100
        s2.center = currentCenter
        self.canvas.add(s2)
        s2.shadow.offset = C4Size(30, 50)
        
        currentCenter.x += 100
        s3.center = currentCenter
        self.canvas.add(s3)
        s3.shadow.offset = C4Size(30, 50)
        
        
        s1.shadow.opacity = 0.8
        s2.shadow.opacity = 0.8
        s3.shadow.opacity = 0.8
        
    }
}