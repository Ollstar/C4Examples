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

    var types = ["Shapes","Images","Movies","Fonts","Colors","NewMath", "AudioPlayer", "Views", "ImageFilters", "Interaction", "Advanced"]
    var maxInt = 29
    var examples = [CanvasController]()
    
    override func setup() {
        for type in types {
            var str = "C4Examples."
            str += type
            for i in 1...maxInt {
                var newStr = str

                newStr = i < 10 ? newStr + "0" + String(i) : String(i)
                let className = newStr
                if let aClass = NSClassFromString(className) as? CanvasController.Type {
                    let example = aClass.init()
                    examples.append(example)
                }
            }
        }
        addFirstExample()
        let t = Timer(interval: 0.25) {
            if let example = self.examples.first {
                self.canvas.remove(example.canvas)
                example.removeFromParentViewController()
                self.examples.removeFirst()
                self.addFirstExample()
            }
    
        }.start()
    }
    
    func addFirstExample() {
        if let example = examples.first {
            self.addChildViewController(example)
            canvas.add(example.canvas)
        }
    }
    
}








