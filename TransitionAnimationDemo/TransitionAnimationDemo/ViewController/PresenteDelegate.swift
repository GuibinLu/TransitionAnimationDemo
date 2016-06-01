//
//  PresenteDelegate.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/31.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

import UIKit

class PresenteDelegate: NSObject,UIViewControllerTransitioningDelegate {
    
    var presentInteractive :MyPercentInteractive?
    var dismissInteractive :MyPercentInteractive?
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentedAnimationController()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentedAnimationController()
    }
    
    func interactionControllerForPresentation(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return presentInteractive!.interation == true ? presentInteractive : nil
    }
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return dismissInteractive!.interation == true ? dismissInteractive : nil
    }
    
}
