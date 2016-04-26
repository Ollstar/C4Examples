//
//  ViewController.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-01.
//  Copyright © 2015 Slant. All rights reserved.
//

import UIKit
import C4

class ViewController: CanvasController {

    override func setup() {
        let example = Advanced05()
        self.addChildViewController(example)
        canvas.add(example.canvas)
    }
    
}








