//
//  Views14.swift
//  C4Examples
//
//  Created by Oliver Andrews on 2015-09-09.
//  Copyright © 2015 Slant. All rights reserved.
//

//import C4
//
//class Views14: C4CanvasController {
//    
//    var shapes:[C4Shape]!
//    var s1:C4Rectangle!
//        var s2:C4Rectangle!
//        var s3:C4Rectangle!
//    var l1:C4TextShape!
//        var l2:C4TextShape!
//        var l3:C4TextShape!
//    
//    
//    override func setup() {
//
//    setupShapesAndLabels()
//        for shape in shapes {
//            shape.addTapGestureRecognizer({ (location, state) -> () in
//                self.adjustZPositions()
//            })
//        }
//    [self listenFor:@"touchesBegan" fromObjects:shapes andRunMethod:@"adjustZPositions:"];
//    }
//    
//    func adjustZPositions(notifcation:NSNotification) {
//    C4Shape *touchedShape = (C4Shape *)[notification object];
//    if(touchedShape.zPosition != 3) {
//    for(C4Shape *s in shapes) {
//    if(s == touchedShape) s.zPosition = 3;
//    else s.zPosition = s.zPosition == 1 ? 1 : s.zPosition - 1;
//    }
//    [self setLabels];
//    }
//    }
//    
//    func setLabels() {
//    l1.text = [NSString stringWithFormat:@"%d",(int)s1.zPosition];
//    l2.text = [NSString stringWithFormat:@"%d",(int)s2.zPosition];
//    l3.text = [NSString stringWithFormat:@"%d",(int)s3.zPosition];
//    }
//    
//    func setupShapesAndLabels() {
//    CGRect frame = CGRectMake(0, 0, 200, 200);
//    s1 = [C4Shape ellipse:frame];
//    s2 = [C4Shape ellipse:frame];
//    s3 = [C4Shape ellipse:frame];
//    s1.zPosition = 1;
//    s2.zPosition = 2;
//    s3.zPosition = 3;
//    s1.center = CGPointMake(self.canvas.center.x - 75, self.canvas.center.y + 75);
//    s2.center = CGPointMake(self.canvas.center.x, self.canvas.center.y - 50);
//    s3.center = CGPointMake(self.canvas.center.x + 75, self.canvas.center.y + 75);
//    l1 = [C4Label labelWithText:@"1"];
//    l1.center = CGPointMake(s1.center.x - s1.width/2.1,s1.center.y + s1.height/2.1);
//    l2 = [C4Label labelWithText:@"2"];
//    l2.center = CGPointMake(s2.center.x,s2.center.y - s2.height/1.5);
//    l3 = [C4Label labelWithText:@"3"];
//    l3.center = CGPointMake(s3.center.x + s3.width/2.1,s3.center.y + s3.height/2.1);
//    shapes = @[s1,s2,s3];
//    [self.canvas addObjects:shapes];
//    [self.canvas addObjects:@[l1,l2,l3]];
//    }
//    }
//}
