//
//  PresentedAnimationController.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/31.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit



class PresentedAnimationController: NSObject,UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
        let containerView = transitionContext.containerView()
        
        else{ return }
        
        //在Custom模式下，presentView 不归containerView 管理
        let toView = toVC.view
        
        if toVC.isBeingPresented() {
            let bgView = UIView()
            containerView.addSubview(bgView)
            containerView.addSubview(toVC.view)
            let toViewW = containerView.frame.width * 0.6
            let toViewH = containerView.frame.height * 0.6
            toView.center = containerView.center

            //设定自己的坐标
            toView.bounds = CGRect(x: 0, y: 0, width: 1, height: toViewH)
            
            bgView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
            bgView.center = containerView.center
            bgView.bounds = CGRect(x: 0, y: 0, width: toViewW, height: toViewH)
            UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                toView.bounds = CGRect(x: 0, y: 0, width: toViewW, height: toViewH)
                bgView.bounds = containerView.bounds
                }, completion: { (_) -> Void in
                    let isCancle = transitionContext.transitionWasCancelled()
                    transitionContext.completeTransition(!isCancle)
            })
            
        }
        
        if fromVC.isBeingDismissed() {
            
                let fromView = fromVC.view
            UIView.animateWithDuration(transitionDuration(transitionContext), animations: { () -> Void in
                    fromView.bounds = CGRect(x: 0, y: 0, width: 1, height: fromView.frame.height)
                    fromView.layoutIfNeeded()
                }, completion: { (_) -> Void in
                    let isCancle = transitionContext.transitionWasCancelled()
                    transitionContext.completeTransition(!isCancle)
                    print(containerView.subviews)
            })
            
        }
        
        
        
    }
    
}
