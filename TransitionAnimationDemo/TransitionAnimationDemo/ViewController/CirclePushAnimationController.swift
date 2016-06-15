//
//  CirclePushAnimationController.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/30.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit

enum CircleTransitionType {
    case NavTransitionPush
    case NavTransitionPop
    case ModalTransitionPresentation
    case ModalTransitionDismissal
}

enum ModalTransitionOperation {
    case presentation
    case Dismissal
}

class CirclePushAnimationController: NSObject,UIViewControllerAnimatedTransitioning {
    
    private var transitionType :CircleTransitionType
    
    init(type:CircleTransitionType) {
        transitionType = type
        super.init()
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    /**
     
     * 转场动画效果的主战场
     
     - parameter transitionContext: 转场动画的上下文，包含了各种信息
     
     */
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        guard
            let fromVC    = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
            toVC          = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
            containerView = transitionContext.containerView()
            
            else { return }


        switch transitionType {
            
        case .NavTransitionPop,.ModalTransitionDismissal:
            
            reduceAnimation(toVC, fromeVC: fromVC, containerView: containerView, transitionContext: transitionContext)
            
        case .NavTransitionPush,.ModalTransitionPresentation:
            
            expandAnimation(toVC, fromeVC: fromVC, containerView: containerView, transitionContext: transitionContext)
        }
    }
    
    private func expandAnimation(toVC:UIViewController,fromeVC:UIViewController,containerView:UIView,transitionContext:UIViewControllerContextTransitioning) {
        
        containerView.addSubview(toVC.view)

        circleAniamtion(toVC, fromeVC: fromeVC, containerView: containerView, transitionContext: transitionContext)
    }
    
    private func reduceAnimation(toVC:UIViewController,fromeVC:UIViewController,containerView:UIView,transitionContext:UIViewControllerContextTransitioning) {
        //这一点需要注意一下层级
        if transitionType == .NavTransitionPop {
            containerView.insertSubview(toVC.view, atIndex: 0)
        }
        
        circleAniamtion(toVC, fromeVC: fromeVC, containerView: containerView, transitionContext: transitionContext)
    }
    
    func circleAniamtion(toVC:UIViewController,fromeVC:UIViewController,containerView:UIView,transitionContext:UIViewControllerContextTransitioning) {

        let btnFrame = MyButton.shareButton.frame
        
        var startPath:UIBezierPath
        var endPath:UIBezierPath
        var aniVC:UIViewController
        
        switch transitionType {
        case .NavTransitionPush,.ModalTransitionPresentation:
            startPath = UIBezierPath(ovalInRect: btnFrame)
            let x = max(btnFrame.origin.x, containerView.frame.width - btnFrame.origin.x)
            let y = max(btnFrame.origin.y, containerView.frame.height - btnFrame.origin.y)
            let radius = CGFloat(sqrtf(Float(pow(x, 2) + pow(y,2))))
            endPath = UIBezierPath(arcCenter: containerView.center, radius: radius, startAngle: 0, endAngle:CGFloat( M_PI * Double(2.0)), clockwise: true)
            aniVC = toVC

        case.ModalTransitionDismissal,.NavTransitionPop:
            let radius = CGFloat(sqrtf(Float(pow(containerView.frame.width, 2) + pow(containerView.frame.height,2))))
            startPath = UIBezierPath(arcCenter: containerView.center, radius: radius, startAngle: 0, endAngle:CGFloat( M_PI * Double(2.0)), clockwise: true)
            
            endPath = UIBezierPath(ovalInRect: btnFrame)
            
            aniVC = fromeVC
        }
        
        let mask = CAShapeLayer()
        mask.path = endPath.CGPath
        mask.fillColor = UIColor.greenColor().CGColor
        
        aniVC.view.layer.mask = mask
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.delegate = self
        animation.fromValue = startPath.CGPath
        animation.toValue = endPath.CGPath
        animation.duration = self.transitionDuration(transitionContext)
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fillMode = kCAFillModeForwards
        animation.setValue(transitionContext, forKey: "context")
        mask .addAnimation(animation, forKey: "path")
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        guard let context = anim.valueForKeyPath("context") else {
            return
        }
        context .completeTransition(true)
        
        if transitionType == .NavTransitionPush || transitionType == .ModalTransitionPresentation {
            context .viewControllerForKey(UITransitionContextToViewControllerKey)?.view.layer.mask = nil
        }else{
            context.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
        }
        
        
    }
    
}
