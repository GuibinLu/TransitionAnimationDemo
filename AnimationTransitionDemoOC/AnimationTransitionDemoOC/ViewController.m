//
//  ViewController.m
//  AnimationTransitionDemoOC
//
//  Created by 路贵斌 on 16/6/8.
//  Copyright © 2016年 GirlCunt. All rights reserved.
//

#import "ViewController.h"
#import "CustomAnimationTransition.h"

@interface ViewController ()<UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.delegate 
}


- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{

    return [[CustomAnimationTransition alloc]init];
}

//当是手势控制的时候才应返回手势交互控制器，否则返回nil。因为交互来源是自己写的，所以搞一个变量就可以明确当前是不是正在交互中。
//如果是自定义的交互控制器，针对 presenting.view 和 presented.view 应该分别返回对应的交互控制器。

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return  [[UIPercentDrivenInteractiveTransition alloc]init];
}


@end
