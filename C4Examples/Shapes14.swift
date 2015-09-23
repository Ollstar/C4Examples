//
//  Shapes14.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-03.
//  Copyright © 2015 Slant. All rights reserved.
//

//import UIKit
//import C4
//
//class Shapes14: C4CanvasController {
//    var line1 = C4Line()
//    var line2 = C4Line()
//    var line3 = C4Line()
//    var line4 = C4Line()
//    var line5 = C4Line()
//    var grid = []
//    var pattern = [NSNumber](arrayLiteral: 20)
//    
//    var gridIsVisible:Bool!
//    
//    override func setup() {
//        
//        //create all the lines
//        self.createLines()
//        
//        //create dash pattern
//        self.createDashPattern()
//        
//        //create the grid
//        self.createGrid()
//        
//        //        let patternCount = NSInteger(20)
//        let patternWidth = Double(0.0)
//        for var i = 0; i < 20; i+=2 {
//            
//            //            patternWidth += patternCount[i]
//        }
//        line1.lineDashPattern = pattern as? [NSNumber]
//        
//        
//        line2.lineDashPattern = pattern as? [NSNumber]
//        line2.lineDashPhase = patternWidth * 0.25
//        
//        line3.lineDashPattern = pattern as? [NSNumber]
//        line3.lineDashPhase = patternWidth * 0.5
//        
//        line4.lineDashPattern = pattern as? [NSNumber]
//        line4.lineDashPhase = patternWidth * 0.75
//        
//        line5.lineDashPattern = pattern as? [NSNumber]
//        line5.lineDashPhase = patternWidth
//        
//        
//        
//        //            [self runMethod:@"revealGrid" afterDelay:3.0f];
//    }
//    
//    func createLines() {
//        var endPoints = [C4Point]()
//        //create 2 end points
//        endPoints.append(C4Point())
//        endPoints.append(C4Point(self.canvas.width*0.9,0))
//        
//        //create 5 lines
//        line1 = C4Line(endPoints)
//        line2 = C4Line(endPoints)
//        line3 = C4Line(endPoints)
//        line4 = C4Line(endPoints)
//        line5 = C4Line(endPoints)
//        
//        //center all the lines
//        var center = C4Point(self.canvas.center.x, self.canvas.center.y)
//        center.y = self.canvas.height/6
//        
//        line1.center = center
//        
//        center.y += self.canvas.height/6;
//        line2.center = center;
//        
//        center.y += self.canvas.height/6;
//        line3.center = center;
//        
//        center.y += self.canvas.height/6;
//        line4.center = center;
//        
//        center.y += self.canvas.height/6;
//        line5.center = center;
//        
//        //set their line widths
//        line1.lineWidth = 30.0
//        line2.lineWidth = 30.0
//        line3.lineWidth = 30.0
//        line4.lineWidth = 30.0
//        line5.lineWidth = 30.0
//        
//        //set their stroke colors
//        line1.strokeColor = C4Blue
//        line2.strokeColor = C4Blue
//        line3.strokeColor = C4Blue
//        line4.strokeColor = C4Blue
//        line5.strokeColor = C4Blue
//        
//        //add them to the canvas
//        self.canvas.add(line1)
//        self.canvas.add(line2)
//        self.canvas.add(line3)
//        self.canvas.add(line4)
//        self.canvas.add(line5)
//        
//    }
//    
//    func createDashPattern() {
//        //create a 4-point pattern
//        let width = line1.width / 220.0
//        
//        //slowly increase the size the pattern gap and dashes
//        //gives this pattern: [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10];
//        for var i = 0; i < 20; i+=2 {
//            //            pattern[i] = (i/2+1)*width;   // dash
//            //            pattern[i+1] = (i/2+1)*width; // equal size gap
//        }
//    }
//    
//    func createGrid() {
//        //create a temporary array to hold the lines
//        var gridArray = [][0]
//        var gridLine:C4Line
//        
//        var endPoints = [C4Point]()
//        
//        //set the end points for the grid line
//        endPoints.append(C4Point(self.canvas.center.x+0.5, 0.0))
//        endPoints.append(C4Point(self.canvas.center.x+0.5, self.canvas.height))
//        
//        
//        //create and add the gridLine to the array
//        gridLine = C4Line(endPoints)
//        gridArray.addObject(gridLine)
//        
//        // ----------------------------
//        
//        //set the end points for the next grid line
//        endPoints[0].x = 0;
//        endPoints[0].y = line1.center.y - line1.lineWidth/2;
//        endPoints[1].x = self.canvas.width;
//        endPoints[1].y = line1.center.y - line1.lineWidth/2;
//        
//        //create and add the gridLine to the array
//        gridLine = C4Line(endPoints)
//        gridArray.addObject(gridLine)
//        
//        // ----------------------------
//        
//        //set the end points for the next grid line
//        endPoints[0].x = 0;
//        endPoints[0].y = line5.center.y + line5.lineWidth/2;
//        endPoints[1].x = self.canvas.width;
//        endPoints[1].y = line5.center.y + line5.lineWidth/2;
//        
//        //create and add the gridLine to the array
//        gridLine = C4Line(endPoints)
//        gridArray.addObject(gridLine)
//        
//        // ----------------------------
//        
//        //set the end points for the next grid line
//        endPoints[0].x = line1.a.x;
//        endPoints[0].y = 0;
//        endPoints[1].x = line1.b.x;
//        endPoints[1].y = self.canvas.height;
//        
//        //create and add the gridLine to the array
//        gridLine = C4Line(endPoints)
//        gridArray.addObject(gridLine)
//        
//        // ----------------------------
//        
//        //set the end points for the next grid line
//        endPoints[0].x = line1.b.x;
//        endPoints[0].y = 0;
//        endPoints[1].x = line1.b.x;
//        endPoints[1].y = self.canvas.height;
//        
//        //create and add the gridLine to the array
//        gridLine = C4Line(endPoints)
//        gridArray.addObject(gridLine)
//        
//        // ----------------------------
//        
//        //set the end points for the next grid line
//        endPoints[0].x = line5.a.x;
//        endPoints[0].y = line5.a.y-line5.lineWidth/2.0
//        endPoints[1].x = line1.a.x+line1.width/2.0
//        endPoints[1].y = line1.a.y-line1.lineWidth/2.0
//        
//        //create and add the gridLine to the array
//        gridLine = C4Line(endPoints)
//        gridArray.addObject(gridLine)
//        
//        // ----------------------------
//        
//        //shift the end points for the next grid line
//        endPoints[0].x += line1.width/2;
//        endPoints[1].x += line1.width/2;
//        
//        //create and add the gridLine to the array
//        gridLine = C4Line(endPoints)
//        gridArray.addObject(gridLine)
//        
//        // ----------------------------
//        
//        //style all the lines and add them to the canvas
//        if let gridArray = [C4Line]() as? [C4Line]{
//            for gridLine in gridArray {
//                gridLine.lineWidth = 1.0
//                gridLine.strokeColor = C4Pink
//                gridLine.opacity = 0.0
//                let gridLinePattern = [1.0]
//                gridLine.lineDashPattern = gridLinePattern
//                self.canvas.add(gridLine)
//            }
//            
//        }
//        
//        //create the global grid array (we use this to fade the lines in and out
//        grid = gridArray as! NSArray
//        gridIsVisible = false;
//        
//        //empty the temporary grid array and trash it
//        gridArray.removeAllObjects()
//        //        gridArray = nil
//    }
//    
//    func hideGrid() {
//        //for each line in the grid array, create an animation to fade OUT
//        if let grid = [C4Line]() as? [C4Line]{
//            for line in grid {
//                //    line.animationDuration = 1.0
//                line.opacity = 0.0
//            }
//            gridIsVisible = false;
//        }
//    }
//    
//    func revealGrid() {
//        //for each line in the grid array, create an animation to fade IN
//        if let grid = [C4Line]() as? [C4Line]{
//            
//            for line in grid {
//                //    line.animationDuration = 1.0f;
//                line.opacity = 1.0
//            }
//            gridIsVisible = true;
//        }
//    }
//    func touchesBegan() {
//        //toggle the visibility of the grid
//        if(gridIsVisible == true) {
//            self.hideGrid()
//        } else {
//            self.revealGrid()
//        }
//    }
//}