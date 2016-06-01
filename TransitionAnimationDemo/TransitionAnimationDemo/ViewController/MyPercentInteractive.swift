//
//  MyPercentInteractive.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/6/1.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit

enum Direction{
    case Left
    case Right
    case Up
    case Down
}

enum TransitionType{
    case Push
    case Presente
    case Pop
    case Dismiss
}

class MyPercentInteractive: UIPercentDrivenInteractiveTransition {
    var interation:Bool = false
    var config:(() -> Void)?
    let type:TransitionType
    let direction:Direction
    weak var vc: UIViewController?
    
    init(type:TransitionType,direction:Direction,vc:UIViewController) {
        self.type = type
        self.direction = direction
        self.vc = vc
        super.init()
        addPan(vc.view)
    }
    
    func addPan(view :UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: "pan:")
        view.addGestureRecognizer(pan)
    }
    
    func pan(gesture:UIPanGestureRecognizer) {
        var percent : CGFloat = 0.0
        let point  = gesture.translationInView(gesture.view)
        let max = gesture.view!.frame.width
        switch direction {
        case .Left :
            let x = -point.x
            percent = x / max
        case.Right:
            let x = point.x
            percent = x / max
        case.Up:
            let y = -point.y
            percent = y / max
        case.Down:
            let y = point.y
            percent = y / max
            
            print(percent)
        }
        
        switch gesture.state {
        case .Began :
            interation = true
            self.startTransition()
        case .Changed :
            updateInteractiveTransition(percent)
        
        case .Ended :
            completionSpeed = 0.99
            interation = false
            if percent > 0.7 {
                finishInteractiveTransition()
            }else {
                cancelInteractiveTransition()
            }
        case .Cancelled :
            interation = false
            completionSpeed = 0.99
            cancelInteractiveTransition()
        default :
            break
        }
    }
    
    func startTransition() {
        switch type {
        case .Presente, .Push :
            if  let closure = config {
                closure()
            }
        case .Pop:
            vc?.navigationController?.popViewControllerAnimated(true)
        case .Dismiss:
            vc?.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
}
