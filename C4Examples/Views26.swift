//
//  Views26.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

//
//  Views25.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

//
//  Views24.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-10.
//  Copyright © 2015 Slant. All rights reserved.
//

import C4
import UIKit

class Views26: C4CanvasController {
    
    var s1:C4Circle!
    var s2:C4Rectangle!
    
    
    
    override func setup() {
        
        setupShapes()
        
        s1.shadow.path = s2.path
        
    }
    
    func setupShapes() {
        s1 = C4Circle(center: self.canvas.center, radius: 44)
        s2 = C4Rectangle(frame: s1.frame)
        
        s1.shadow.opacity = 0.8
        s1.shadow.offset = C4Size(50,50)
        self.canvas.add(s1)
    }
}
