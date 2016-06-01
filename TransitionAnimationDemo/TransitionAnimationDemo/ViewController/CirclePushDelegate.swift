//
//  CirclePushDelegate.swift
//  TransitionAnimationDemo
//
//  Created by 路贵斌 on 16/5/30.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

/*
    1.将要发生转场的时候，就会询问代理，这次要执行什么样的动画效果（即返回对应的遵守了动画转场协议的动画控制器）
    2.如果是交互式的转场，还要返回实现了交互动画控制协议的实例对象
*/

import UIKit

class CirclePushDelegate: NSObject,UINavigationControllerDelegate {
    
    var interactive : MyPercentInteractive?
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let type:CircleTransitionType = operation == .Push ? CircleTransitionType.NavTransitionPush :CircleTransitionType.NavTransitionPop
        
        return CirclePushAnimationController(type: type)
    }
    
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive?.interation == true ? interactive : nil;
    }
    
}
