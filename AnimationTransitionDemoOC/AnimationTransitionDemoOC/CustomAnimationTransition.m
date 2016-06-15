//
//  CustomAnimationTransition.m
//  AnimationTransitionDemoOC
//
//  Created by 路贵斌 on 16/6/8.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

#import "CustomAnimationTransition.h"

@implementation CustomAnimationTransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    [container addSubview:toVC.view];
    
    /*
    if (是push) {
        push动画
    }else{
        pop动画。
    }
    */
    
    //动画最好用UIView 封装的
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:10.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        
//    } completion:^(BOOL finished) {
//        2.trancontext.comp
//    }];
    
}



@end
