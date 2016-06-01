//
//  MyButton.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/30.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    
    static let shareButton:MyButton =  {
        let btn = MyButton(type: .Custom)
        btn.frame = CGRect(x: 200, y: 200, width: 150, height: 150)
        btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        btn.setTitle("变大！", forState: .Normal)
        btn.backgroundColor = UIColor.cyanColor()
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 75.0
        return btn
    }()
    
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
//        
//        guard
//        let current = touch?.locationInView(self),
//        previous = touch?.preciseLocationInView(self)
//        else { return }
//        
//        
//        var center = self.center
//        
//        center.x += current.x - previous.x
//        center.y += current.y - previous.y
//        
//        let screenW = UIScreen.mainScreen().bounds.width
//        let screenH = UIScreen.mainScreen().bounds.height
//        
//        let xMin = self.frame.width * 0.5
//        let xMax = screenW - xMin
//        let yMin:CGFloat = 100.0
//        let yMax = screenH - yMin
//        
//        if center.x < xMin {
//            center.x = xMin
//        }
//        
//        if center.x > xMax {
//            center.x = xMax
//        }
//        
//        if center.y < yMin {
//            center.y = yMin
//        }
//        
//        if center.y > yMax {
//            center.y = yMax
//        }
    }
    
}
